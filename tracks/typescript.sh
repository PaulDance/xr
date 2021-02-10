# Installs dependencies, force-activates and runs all the available tests
# and lints. Lints are not ran if tests fail.
function _run_tests() {
    NODE_ENV='development' yarn install \
        && sed -Ei 's/(\s*)xit\(/\1it\(/g' *.test.ts \
        && yarn test --all \
        && yarn lint
}

# N/A.
function _run_benches() {
    echo "The TypeScript track does not support benchmarks." >&2
    return 1
}
