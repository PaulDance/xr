# Main plugin file.

# Constants.
_exo_config=".exercism/metadata.json"

# Finding the location of the sourced script is shell-specific
# Currently, zsh and bash are the only supported shells
if [ -n "$ZSH_VERSION" ]; then
    _dir="$(dirname "$(readlink -f "$0")")"
elif [ -n "$BASH_VERSION" ]; then
    _dir="$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")"
else
    echo "This is an unsupported shell." >&2
    return 1
fi

read -r -d '' _short_doc << EOF
Usage: xr [<command>] [<uuid>]
    h, help   Display a more complete help message.
    c, clean  Remove all the downloaded student submissions.
    n, notes  Print the mentoring notes for the current or given exercise.
    e, edit   Open the mentoring notes in an editor.
    t, test   Run the tests.
    b, bench  Copy the custom benchmarks into 'benches' and run them.
EOF

read -r -d '' _long_doc << EOF
Usage: xr [<command>] [<uuid>]

Arguments:
    command   Optional subcommand, see below; when ommitted, defaults to 'test'.
    uuid      Unique identifier for a submission: a 32-digit hex value. If a
              UUID is given, whatever the command used except for 'help', first
              the corresponding exercise is downloaded using \`exercism\` and
              the shell's current directory is changed to the returned value,
              then the command's actual operation is executed.

Commands:
    h, help   Display this message.
    c, clean  Confirm and remove all the downloaded student submissions from
              the filesystem using \`exercism\` in order to determine their
              location.
    n, notes  Dump the contents of the mentoring notes for the current exercise
              to the standard output, as deduced by reading the exercise config,
              or from an exercise or topic of your choice through a second
              argument, but in this case it must be explicitly prefixed with the
              track name like so for example: \`xr notes rust/anagram\`.
    e, edit   Open the mentoring notes for the current exercise in the editor
              specified by the EDITOR environment variable, as deduced by
              reading the exercise's configuration, or from an exercise or topic
              of your choice through a second argument with the same rules as
              'notes'.
    t, test   Source the current track's script functions and run the unit tests
              of the local exercise according to the dedicated function. This is
              the default command when not specifying one but still giving a UUID.
    b, bench  Source the current track's script functions and run the benchmarks
              of the local exercise according to the dedicated function. It is
              usually copying a file to its correct place and call the bencher.
              The path of the file to copy is deduced from the exercise's local
              \`$_exo_config\` configuration file.
EOF

# Returns the value associated to the given key in the exercise's configuration.
function _config_get() {
    grep -Eo "\"$1\""':"[a-zA-Z0-9-]+"' "$_exo_config" \
        | cut -d':' -f2 \
        | cut -d'"' -f2
}

# Downloads and goes to the directory of the given UUID's exercise.
function _dl_exo() {
    cd $(exercism download --uuid="$1" 2>/dev/null | tail -n 1)
}

# Fetches the track-specific functions from the dedicated script.
function _src_track() {
    local script="$_dir/tracks/$(_config_get track).sh"

    if [[ -f "$script" ]]; then
        source "$script"
    else
        echo "Unknown track script file: $script" >&2
        return 1
    fi
}

# Tests whether the given string is a valid UUID or not.
function _is_uuid() {
    [[ "$1" =~ ^[[:xdigit:]]{32}$ ]]
}

# Public function.
function xr() {
    if [[ "$#" == "0" || "$#" -gt "2" ]]; then
        echo "$_short_doc" >&2
        return 1
    else
        case "$1" in
            "h" | "help")
                echo "$_long_doc"
            ;;
            "c" | "clean")
                local dir="$(exercism workspace)/users" \
                    && echo "Will delete: $dir" \
                    && rm -rI "$dir"
            ;;
            "n" | "notes" | "e" | "edit")
                local note="$_dir/notes"

                if [[ "$#" == "2" ]]; then
                    note="$note/$2.md"
                else
                    note="$note/$(_config_get track)/$(_config_get exercise).md"
                fi

                if [[ ( "$1" == "n" ) || ( "$1" == "notes" ) ]]; then
                    if [[ -f "$note" ]]; then
                        cat "$note"
                    else
                        echo "Unknown exercise or topic note: $note" >&2
                        return 1
                    fi
                elif [[ "$(basename $note)" != ".md" ]]; then
                    $EDITOR "$note"
                else
                    echo "Current directory is not an exercise." >&2
                    return 1
                fi
            ;;
            "t" | "test" | "b" | "bench")
                if [[ "$#" == "2" ]]; then
                    if _is_uuid "$2"; then
                        _dl_exo "$2"
                    else
                        echo "Invalid UUID: $2" >&2
                        return 1
                    fi
                fi

                case "$1" in
                    "t" | "test")
                        _src_track && _run_tests
                    ;;
                    "b" | "bench")
                        _src_track && _run_benches
                    ;;
                esac
            ;;
            *)
                if _is_uuid "$1"; then
                    _dl_exo "$1" \
                        && _src_track \
                        && _run_tests
                else
                    echo "Unsupported command: $1" >&2
                    return 1
                fi
            ;;
        esac
    fi
}
