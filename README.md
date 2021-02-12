# XR: The Exercism Runner

This repository provides a shell plugin one can use in order to speed up
repetitive but necessary steps when reviewing submissions as an
[@exercism](https://github.com/exercism) mentor, such as: download the latest
iteration of a student, compile and run the tests, import and run a custom set
of benchmarks, view mentoring notes, etc...

## Environments supported

The plugin is still in early development stages, so as of writing this, it only
supports the expected environment when mentoring on the **Rust** track.

## Requirements

This tool is a shell plugin: a collection of shell constructs one will `source`
in order to retrieve them. The shell itself must be **Bash-compatible**, like
Bash obviously but Zsh as well for example. Then there are the programs and
libraries required by the track you are mentoring for. Other than that, it only
uses core utilities expected on any GNU operating system, such as `cp`, `grep`,
`cut`...

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

## Contributing

See the [contributing guidelines](CONTRIBUTING.md).
