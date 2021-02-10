# Runs all the available tests.
function _run_tests() {
    BATS_RUN_SKIPPED='true' bats --pretty *_test.sh
}

# N/A.
function _run_benches() {
    echo "The Bash track does not support benchmarks." >&2
    return 1
}
