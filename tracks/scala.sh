# Runs all the available tests.
function _run_tests() {
    sbt test
}

# N/A.
function _run_benches() {
    echo "The Scala track does not support benchmarks." >&2
    return 1
}
