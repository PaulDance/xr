# Runs all the available tests.
function _run_tests() {
    stack test -Wall --trace \
        && hlint .
}

# Just runs any available benchmark, importing still needs to be added.
function _run_benches() {
    stack bench -Wall --no-run-tests
}
