# Force-activates and runs all the available tests.
function _run_tests() {
    sed -Ei 's/\s*skip.*//g' *_test.rb \
        && ruby -Uw *_test.rb
}

# N/A.
function _run_benches() {
    echo "The Ruby track does not support benchmarks." >&2
    return 1
}
