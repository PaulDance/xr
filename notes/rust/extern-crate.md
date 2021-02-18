This is not needed:

```rust
extern crate ...;
```

Beginning in the 2018 edition, `use` declarations can reference crates in the
extern prelude, so it is considered unidiomatic to use [extern
crate](https://doc.rust-lang.org/reference/items/extern-crates.html). In other
words, you don't need `extern crate`, `use` will do.

When using an external crate for a solution, please include the Cargo.toml file
in the submission, something like so:

```rust
exercism submit Cargo.toml src/lib
```
