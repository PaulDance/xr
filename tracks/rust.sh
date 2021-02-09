# Runs all the available tests, including disabled ones.
function _run_tests() {
    cargo +nightly test --all-features -- -Z unstable-options --include-ignored
}

# Copies the stored benchmarks into the dedicated sub-directory and runs them.
function _run_benches() {
    local bench_loc="$_dir/benches/rust/$(_config_get exercise).rs"

    if [[ -f "$bench_loc" ]]; then
        mkdir -p "./benches" \
            && cp "$bench_loc" './benches/custom.rs' \
            && cargo +nightly bench --all-features
    else
        echo "Unknown custom bench: $bench_loc" >&2
        return 1
    fi
}
