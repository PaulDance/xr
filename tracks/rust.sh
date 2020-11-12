# Hard-activates and runs all the available tests.
function _run_tests() {
    sed -i 's/#\[ignore\]$//g' tests/*.rs \
        && cargo +nightly test --all-features
}

# Copies the stored benchmarks into the dedicated sub-directory and runs them.
function _run_benches() {
    local bench_loc="$_dir/benches/rust/$(_config_get exercise).rs"

    if [[ -f "$bench_loc" ]]; then
        mkdir -p "./benches" \
            && cp "$bench_loc" './benches/custom.rs' \
            && cargo +nightly bench --all-features
    else
        echo "Unknown custom bench: $bench_loc"
        return 1
    fi
}
