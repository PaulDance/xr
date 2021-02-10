# Runs all the available tests.
function _run_tests() {
    phpunit --strict-global-state *_test.php
}

# N/A.
function _run_benches() {
    echo "The PHP track does not support benchmarks." >&2
    return 1
}
