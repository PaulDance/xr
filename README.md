# XR: The Exercism Runner

This repository provides a shell plugin one can use in order to speed up
repetitive but necessary steps when reviewing submissions as an
[@exercism](https://github.com/exercism) mentor, such as: download the latest
iteration of a student, compile and run the tests, import and run a custom set
of benchmarks, view mentoring notes, etc...


## Supported tracks

The plugin currently supports a good amount of track environments, at least
when considering unit testing automation:

 * Bash: tests only.
 * C: tests only.
 * C++: tests only.
 * C#: tests only.
 * F#: tests only.
 * Go: tests and partial benchmarks (just running, no importing).
 * Groovy: tests only.
 * Haskell: tests and partial benchmarks.
 * Java: tests only.
 * JavaScript: tests only.
 * Kotlin: tests only.
 * Perl5: tests only.
 * PHP: tests only.
 * Python: tests only.
 * Ruby: tests only.
 * Rust: tests and full benchmarks.
 * Scala: tests only.
 * TypeScript: tests only.

If you would like to see a new track supported or an already-existing one
improved, take a look at the [contributing guidelines](CONTRIBUTING.md).


## Requirements

This tool is a shell plugin: a collection of shell constructs one will `source`
in order to retrieve them. The shell itself must be **Bash-compatible**, like
Bash obviously but Zsh as well for example. Then there are the programs and
libraries required by the track you are mentoring for, in particular the
`exercism` CLI itself. Other than that, it only uses core utilities expected on
any GNU operating system, such as `cp`, `grep`, `sed`, `cut`, `rm`... and a
text editor available from the shell and set as the value of the `$EDITOR`
environment variable if you wish to use the `xr edit` functionality.


## Installation

 * If you are using Zsh with a plugin manager similar to OhMyZsh, then you can
   simply clone this repository in the directory dedicated to custom plugins,
   usually: `~/.oh-my-zsh/custom/plugins` and then add this plugin's name to
   the `plugins` array in your shell's main configuration file, like `~/.zshrc`
   for Zsh:

    ```bash
    plugins=(
        ...     # Other plugins you may have.
        xr
    )
    ```

    In order to get upcoming updates easily, we would recommend using a
    [dedicated plugin](https://github.com/TamCore/autoupdate-oh-my-zsh-plugins).

 * If you only have Bash or a Bash-like shell without an equivalent plugin
   manager, then you have to clone this repository *somewhere* on your file
   system that is convenient for you and then add the following line to your
   shell's main configuration file, like `~/.bashrc` for Bash:

   ```bash
   source <path-to-repo>/xr.sh
   ```


## Usage

Once the plugin successfully sourced, one can then start to use the provided
`xr` shell function. Type `xr help` to get started with a more detailed
overview of its capacities.

The usual workflow is as such:

 * Run `xr <uuid>` where `<uuid>` is a given submission's identificator as
   listed on the iteration page. This will: download the submission, go to its
   directory, potentially force-activate, compile and run all the available
   unit tests.
 * If you wish you may then run the tests again using `xr test`.
 * Run `xr bench` to automatically import, compile and run benchmarks if they
   exist for the current track and exercise.
 * Run `xr notes` to display the mentoring notes for the current exercise.
 * Run `xr edit` in order to open the mentoring notes for the current exercise
   using the configured text editor.
 * When done for the day, you may run `xr clean` in order to remove all
   downloaded exercise submissions.

## Track-specific settings

### Haskell

You can optionally override a student iteration's resolver by setting
`XR_HASKELL_STACK_RESOLVER` to a valid resolver version, for example
`XR_HASKELL_STACK_RESOLVER=lts-16.21 xr t`.

## Contributing

See the [contributing guidelines](CONTRIBUTING.md).
