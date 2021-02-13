# Contributing guidelines

Any form of contribution is always welcome! Know that using the plugin is
already a form of contribution, as it helps testing a lot of things, so issues
are welcome as well! There is definitely room for contribution concerning
additional tracks, mentoring notes and custom benchmarks, as the latter two
were initially kindly provided by [@bobahop](https://github.com/bobahop), but
originated from personal notes accumulated over the months and have been dusted
and reorganized since. In any case, don't hesitate to open up an issue or a
pull request, we can always discuss details then!


## Architecture

This plugin's main components are organized as such:

```
├── xr.sh
├── tracks
│   ├── rust.sh
│   ├── java.sh
│   ├── python.sh
│   └── ...
├── benches
│   ├── rust
│   │   ├── grains.rs
│   │   ├── saddle-points.rs
│   │   └── ...
│   ├── c
│   │   └── ...
│   └── ...
└── notes
    ├── rust
    │   ├── minesweeper.md
    │   ├── benchmarks.md
    │   └── ...
    ├── bash
    │   └── ...
    └── ...
```

 * `xr.sh` is the main shell script. `_xr` and `xr.plugin.zsh` are Zsh and
   OhMyZsh specific things.
 * `tracks` contains all the track scripts. Each file in this directory is
   either a regular shell script or a symbolic link to one next to it that
   provides two functions: `_run_tests` and `_run_benches` that should handle
   the track-specific operations in order to respectively compile and execute
   the unit tests, and import into the current exercise, compile and execute
   the custom performance benchmarks. More on this in [Adding
   tracks](#adding-tracks).
 * `benches` contains the custom benchmarks for each track. Its direct children
   are directories by track name. These store benchmark files organized by
   exercise name, for example one file per exercise, but the structure here is
   more track-specific. Further details in [Adding
   benchmarks](#adding-benchmarks).
 * `notes` contains all the mentoring notes. Its direct children are
   directories by track name. These store benchmark files organized by exercise
   or general topic name. Notes are in the Markdown format. See the [Adding
   notes](#adding-notes) section for more information.


## Operation

This section explains the overall operation of the plugin. It is useful in
order to understand a bit more why some of the requirements for track scripts,
benchmarks and notes are so.

In the common mentoring flow, one usually starts by downloading an exercise
using for example `xr <some-id>`. This starts by executing `_dl_exo <that-id>`
which simply calls the `exercism` CLI in order to download the corresponding
submission and `cd` to its directory after.

Then, either because only an iteration UUID has been given or because the
`test` command is used, the `xr` function calls `_src_track`. This function
gets the current track *slug* using `_config_get`. *Slug* is the general term
used in Exercism to denote a precise and unambiguous name for tracks and
exercises mostly. For example, "C#" is `csharp` and "Saddle Points" is
`saddle-points`. `_config_get` is really simple: it reads the
`.exercism/metadata.json` configuration file that is present in every
downloaded exercise in order to retrieve the value mapped to the given key.
For example, in a Rust exercise instance of Minesweeper, `_config_get track`
returns `rust` and `_config_get exercise` returns `minesweeper`. Using this
function, `_src_track` is therefore able to determine where is located the
corresponding track script and just `source`s it, or terminates on an error if
it does not exist. After that, the freshly sourced track-specific `_run_tests`
function is called. The idea is very similar for benchmarks: `_run_benches` is
used instead.

Concerning notes, some mechanisms are in common: when giving a custom topic or
exercise to display, `.md` is appended at its end and `notes/` is prepended at
its start in order to form a file name to look for in the plugin's directory
structure; otherwise, if no topic name is given, `_config_get track` and
`_config_get exercise` are used to automatically retrieve that part of the
filename. Editing a note is the same, the only difference is that `$EDITOR` is
called on the file instead of just `cat`.


## Potential contribution

There are multiple ways one can contribute to this project: add support for new
tracks, complete or improve an existing track scripts, add custom benchmarks
and mentoring notes. This section explains the requirements in order to do so
properly. As a general note, the Rust track should be a good source of
inspiration for the various following parts.


### Adding tracks

In order to implement a new track, one has to start by creating a new track
script that must be named after the track's slug, i.e. `common-lisp.sh` for
Common Lisp or `plsql.sh` for PL/SQL. To determine this name, you can either
print the current working directory when in a downloaded exercise, look at the
exercise's `.exercism/metadata.json` file, at the track's main page URL on the
website or in Exercism's source repositories. This new file must be placed in
the plugin's `tracks` directory. In it, the `_stub.sh` file is provided so one
may copy it and have a good start.

Once the track script is created, one must implement in it the two functions
included in `tracks/_stub.sh`: `_run_tests` and `_run_benches`. To implement
them, one should restrict themselves to the most essential programs in order to
limit the dependencies of the plugin. A non-essential program is pretty much
everything that is not part of GNU/Linux Debian packages such as `coreutils`,
`grep` or `sed`. Also, these functions should fail-fast: use `&&` between your
program or function calls and 1 as a general error status code.

 * `_run_tests` is responsible for automatically activating, compiling and
   executing all the available unit tests of the current exercise. The user
   should not have to run another command after this to run other tests,
   everything should be automated by this function. If lints are also part of
   the track, run them as well. Sometimes, the track does not expect to use
   tools that enable running disabled tests, so one may need to force-activate
   these by editing the test files: use `sed` for example in order to automate
   this part.
 * `_run_benches` is responsible for automatically importing, compiling and
   executing custom benchmarks stored in the plugin. It is also responsible for
   enforcing a structure for the `benches/<track-slug>` directory. If possible,
   this should be one file per exercise, using its slug followed by the
   expected file extension as a name; otherwise the function must be consistent
   with this structure. The function must automate everything as well: the user
   should not have to run another command than `xr bench` to run all these
   steps. One should of course use the `_config_get` function in order to
   retrieve the current exercise's name and copy the benchmark file(s) to the
   expected place of the exercise's directory.

One may also add a new track with only partial functionality available by just
terminating on an error in `_run_benches`. Actually, most of the tracks do not
have the function properly implemented, this is why `tracks/_stub.sh` has it
with an error message and return status code by default. When doing so however,
one must still define both functions in the track script so the plugin does not
break and entirely implement `_run_tests` as it is at the core of Exercism's
teaching. Also, one must adapt the error message to the track so it may be more
user-friendly. So as a lot of `_run_benches` are not properly implemented,
doing it is definitely a welcome improvement.

Finally, when adding support for a new track, although it would be better, one
does not need to add benchmarks files and mentoring notes at the same time.
These aspects of the plugin are kept separate, so it can be implemented, added
or improved at a later date. In particular, there is no need to use `.gitkeep`
conventional hacks in order to ensure the existence of some directories: things
should fail gracefully.

When done adding or improving a track script, one should also update the main
`README.md`'s ["Supported tracks" section](README.md#supported-tracks) in order
to reflect the achieved progress.


### Adding benchmarks

Creating new benchmarks is done either by implementing new benchmark functions
or equivalent in an already-existing exercise's benchmark file or directory, or
by creating a new benchmark file or directory to provide support for another
exercise. Either way, it must be consistent with the chosen structure for
`benches/<track-slug>` and benchmarking framework or tools enforced by the
track's script. In particular, when running `xr bench` in a downloaded
iteration of the concerned exercise, everything must succeed as expected.

For example, Rust's official benchmarking framework is directly available
through `cargo`.  The only thing it expects is to see modules which names do
not matter in a `benches` directory under the current project's root. Then one
simply runs `cargo +nightly bench` to compile and run them. Therefore, the
plugin's `benches/rust` directory may be organized only using files directly
named after exercises. However these names are not authorized as Rust module
names, so when imported, benchmark files are simply renamed as `custom.rs`: the
name itself does not matter, it just has to respect Rust's naming convention.

Designing benchmarks can be a bit tricky however. One should search around
questions such as: what cases could be interesting performance-wise? which
should be the fastest? the slowest? Try to find corner cases. The unit tests
are usually a good source of inspiration as they already cover a lot of corner
cases and the student is then able to reproduce the benchmark easily.

For instance, Rust's benchmark file for Two Bucket is `benches/rust/two-bucket.rs`
and looks like this as of writing:

```rust
#![feature(test)]
extern crate test;
use test::Bencher;
use two_bucket::*;

#[bench]
fn test_case_4(b: &mut Bencher) {
    b.iter(|| solve(7, 11, 2, &Bucket::Two))
}
```

The benchmarking function is directly named after one of the unit tests and the
testing case is kept exactly identical.


### Adding notes

This should be the easiest to do: one only needs to add some text to files or
add new files. The requirements are: a mentoring note file must be placed in
its corresponding track directory under `notes` and be named after the targeted
topic-or-exercise's slug with `.md` appended at the end. For example, notes for
Rust's Beer Song are available in the `notes/rust/beer-song.md` file, or the
topic about `rustfmt` is covered in `notes/rust/rustfmt.md`. One chooses the
topic names however one wants obviously, but it must follow the "kebab-case"
naming convention like track or exercise slugs.

Writing notes is not that complicated either: one should aim at covering the
most frequent remarks one does when mentoring, so that one may copy-paste from
these as much as possible to speed up their mentoring process. They can be
positive points noting the submission's quality regarding certain aspects,
usually presented in lists, or suggestions on how it could be improved, often
in separate paragraphs. One should respect the various Markdown formatting
conventions and also hard-wrap all lines at 80 characters: editors usually help
in this regard.
