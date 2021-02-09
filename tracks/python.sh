# Runs all the available tests.
function _run_tests() {
    python3 -m pytest -rapP
}

# None configured.
function _run_benches() {
    echo "The Python track does not support benchmarks." >&2
    return 1
}
