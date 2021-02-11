# Force-activates and runs all the available tests.
function _run_tests() {
    sed -Ei 's/\s*TEST_IGNORE\(\);.*//g' test/test_*.c \
        && make -j test \
        && make -j memcheck
}

# N/A.
function _run_benches() {
    echo "The C track does not support benchmarks." >&2
    return 1
}
