# Main plugin file.

_uuid_len=32
_exo_config=".exercism/metadata.json"

read -r -d '' _short_doc << EOF
Usage: xr [<command>] [<uuid>]
    help    Display a more complete help message.
    notes   Print the mentoring notes for the current exercise.
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
    notes   Dump the contents of the mentoring notes for the current exercise
            to the standard output, as deduced by reading the exercise config.
    test    Activate all unit tests available by modifying files and run them
            with all features activated in nightly environment. This is the
            default command when not specifying one but still giving a UUID.
    bench   Force copy custom benchmarks from the database into the 'benches'
            directory of the exercise and run them in nightly environment.
            The path of the file to copy is deduced from the exercise's local
            \`$_exo_config\` configuration file.
EOF

function _config_get() {
    grep -Eo "\"$1\""':"[a-zA-Z0-9]+"' "$_exo_config" \
        | cut -d':' -f2 \
        | cut -d'"' -f2
}

function xr() {
    if [[ "$#" == "0" || "$#" -gt "2" ]]; then
        echo "$_short_doc"
        return 1
    elif [[ "$1" == "help" ]]; then
        echo "$_long_doc"
        return 0
    fi
}
