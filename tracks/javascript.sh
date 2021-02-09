# Installs dependencies, force-activates and runs all the available tests
# and lints. Lints are not ran if tests fail.
function _run_tests() {
    npm install --include=dev \
        && sed -Ei 's/(\s*)xtest\(/\1test\(/g' *.spec.js \
        && npm run test -- --all \
        && npm run lint
}

# N/A.
function _run_benches() {
    echo "The JavaScript track does not support benchmarks." >&2
    return 1
}
