function _override_stack_resolver() {
    if [[ -z "$XR_HASKELL_STACK_RESOLVER" ]]; then
        return
    fi

    # See https://docs.haskellstack.org/en/stable/pantry/#snapshot-location for
    # the resolver syntax. For the purpose of running exercises, it's reasonable
    # just to allow LTS and nightly.
    if ! [[ "$XR_HASKELL_STACK_RESOLVER" =~ ^(lts-[0-9\.]+|nightly-[0-9-]+)$ ]]; then
        echo Skipped resolver override as $XR_HASKELL_STACK_RESOLVER is not allowed.
        return
    fi

    if ! stack --resolver="$XR_HASKELL_STACK_RESOLVER" eval '()' 2>&1 >/dev/null; then
        echo Skipped resolver override as stack cannot recognize $XR_HASKELL_STACK_RESOLVER.
        return
    fi

    echo Overriding resolver to $XR_HASKELL_STACK_RESOLVER.
    sed -i 's/resolver: .*/resolver: '"$XR_HASKELL_STACK_RESOLVER"'/' stack.yaml
}

# Runs all the available tests.
function _run_tests() {
    _override_stack_resolver \
        && stack test --ghc-options -Wall \
        && hlint .
}

# Just runs any available benchmark, importing still needs to be added.
function _run_benches() {
    _override_stack_resolver \
        && stack bench --ghc-options -Wall --no-run-tests
}
