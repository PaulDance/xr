# Force-activates and runs all the available tests.
function _run_tests() {
    sed -Ei 's/(\s*)\[(<?)Fact\(Skip.*\)(>?)\]/\1[\2Fact\3]/g' *Tests.(cs|fs) \
        && dotnet test
}

# N/A.
function _run_benches() {
    echo "This .NET-based track does not support benchmarks." >&2
    return 1
}
