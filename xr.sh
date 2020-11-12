# Main plugin file.

_exo_config=".exercism/metadata.json"
_dir="$(dirname "$(readlink -f "$0")")"

read -r -d '' _short_doc << EOF
Usage: xr [<command>] [<uuid>]
    help    Display a more complete help message.
    clean   Remove all the downloaded student submissions.
    notes   Print the mentoring notes for the current or given exercise.
    edit    Open the mentoring notes in an editor.
    test    Run the tests.
    bench   Copy the custom benchmarks into 'benches' and run them.
EOF

read -r -d '' _long_doc << EOF
Usage: xr [<command>] [<uuid>]

Arguments:
    command Optional subcommand, see below; when ommitted, defaults to 'test'.
    uuid    Unique identifier for a submission: $_uuid_len-digit hex value.
            If a UUID is given, whatever the command used except for 'help',
            first the corresponding exercise is downloaded using \`exercism\`
            and the shell's current directory is changed to the returned value,
            then the command's actual operation is executed.

Commands:
    help    Display this message.
    clean   Confirm and remove all the downloaded student submissions from the
            filesystem using \`exercism\` in order to determine their location.
    notes   Dump the contents of the mentoring notes for the current exercise
            to the standard output, as deduced by reading the exercise config,
            or from an exercise or topic of your choice through a second argument.
    edit    Open the mentoring notes for the current exercise in the editor
            specified by the EDITOR environment variable, as deduced by reading
            the exercise's configuration, or from an exercise or topic of your
            choice through a second argument.
    test    Activate all unit tests available by modifying files and run them
            with all features activated in nightly environment. This is the
            default command when not specifying one but still giving a UUID.
    bench   Force copy custom benchmarks from the database into the 'benches'
            directory of the exercise and run them in nightly environment.
            The path of the file to copy is deduced from the exercise's local
            \`$_exo_config\` configuration file.
EOF

function _config_get() {
    grep -Eo "\"$1\""':"[a-zA-Z0-9-]+"' "$_exo_config" \
        | cut -d':' -f2 \
        | cut -d'"' -f2
}

function _dl_exo() {
    cd $(exercism download --uuid="$1" 2>/dev/null | tail -n 1)
}

function _src_track() {
    local script="$_dir/tracks/$(_config_get track).sh"

    if [[ -f "$script" ]]; then
        source "$script"
    else
        echo "Unknown track script file: $script"
        return 1
    fi
}

function _is_uuid() {
    [[ "$1" =~ '^[a-z0-9]{32}$' ]]
}

function xr() {
    if [[ "$#" == "0" || "$#" -gt "2" ]]; then
        echo "$_short_doc"
        return 1
    else
        case "$1" in
            "help")
                echo "$_long_doc"
            ;;
            "clean")
                local dir="$(exercism workspace)/users" \
                    && echo "Will delete: $dir" \
                    && rm -rI "$dir"
            ;;
            "notes" | "edit")
                local note="$_dir/notes"

                if [[ "$#" == "2" ]]; then
                    note="$note/$2.md"
                else
                    note="$note/$(_config_get exercise).md"
                fi

                if [[ "$1" == "notes" ]]; then
                    if [[ -f "$note" ]]; then
                        cat "$note"
                    else
                        echo "Unknown exercise or topic note: $note"
                        return 1
                    fi
                elif [[ "$(basename $note)" != ".md" ]]; then
                    $EDITOR "$note"
                else
                    echo "Current directory is not an exercise."
                    return 1
                fi
            ;;
            "test" | "bench")
                if [[ "$#" == "2" ]]; then
                    if _is_uuid "$2"; then
                        _dl_exo "$2"
                    else
                        echo "Invalid UUID: $2"
                        return 1
                    fi
                fi

                case "$1" in
                    "test")
                        _src_track && _run_tests
                    ;;
                    "bench")
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
                    echo "Unsupported command: $1"
                    return 1
                fi
            ;;
        esac
    fi
}

