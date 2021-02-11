# Runs all the available tests.
function _run_tests() {
    cmake -B build \
        && cmake --build build
}

# N/A.
function _run_benches() {
    echo "The C++ track does not support benchmarks." >&2
    return 1
}
