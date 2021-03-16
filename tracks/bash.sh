# Runs all the available tests, and the linter.
function _run_tests() {
    local ex=$(_config_get exercise)

    printf "Testing %s:\n\n" "$ex"
    if command -v bats >/dev/null; then
        BATS_RUN_SKIPPED='true' command bats --pretty ./*_test.sh
    else
        echo "Installing bats-core is required"
        echo "=> https://bats-core.readthedocs.io/en/latest/"
        return 1
    fi

    printf "\nShellcheck:\n"
    if command -v shellcheck >/dev/null; then
        command shellcheck "${ex//-/_}.sh" && echo OK
    else
        echo "Installing shellcheck is recommended"
        echo "=> https://github.com/koalaman/shellcheck#user-content-installing"
    fi
}

# N/A.
function _run_benches() {
    echo "The Bash track does not support benchmarks." >&2
    return 1
}
