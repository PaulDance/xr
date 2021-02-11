# Runs all the available tests.
function _run_tests() {
    go test -v -race
}

# Just runs any available benchmark, importing still needs to be added.
function _run_benches() {
    go test -v --bench . --benchmem
}
