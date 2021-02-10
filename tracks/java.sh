# Taken from OhMyZsh's Gradle plugin:
# Looks for a gradlew file in the current working directory
# or any of its parent directories, and executes it if found.
# Otherwise it will call gradle directly.
function _gradle_or_gradlew() {
    # find project root
    # taken from https://github.com/gradle/gradle-completion
    local dir="$PWD" project_root="$PWD"

    while [[ "$dir" != / ]]; do
        if [[ -f "$dir/settings.gradle" \
            || -f "$dir/settings.gradle.kts" \
            || -f "$dir/gradlew" ]]
        then
            project_root="$dir"
            break
        fi
        dir="${dir:h}"
    done

    # if gradlew found, run it instead of gradle
    if [[ -f "$project_root/gradlew" ]]; then
        echo "executing gradlew instead of gradle"
        chmod u+x "$project_root/gradlew"
        "$project_root/gradlew" "$@"
    else
        command gradle "$@"
    fi
}

# Force-activates and runs all the available tests.
function _run_tests() {
    sed -Ei 's/.*@(Ignore|Disabled).*//g' \
            src/test/$(_config_get track)/*.(java|kt|groovy) \
        && _gradle_or_gradlew test
}

# N/A.
function _run_benches() {
    echo "This JVM+Gradle-based track does not support benchmarks." >&2
    return 1
}
