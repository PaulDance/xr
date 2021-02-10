# Runs all the available tests.
function _run_tests() {
    prove -ftw --trap --shuffle --recurse .
}

# N/A.
function _run_benches() {
    echo "The Perl5 track does not support benchmarks." >&2
    return 1
}
