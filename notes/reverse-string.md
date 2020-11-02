Congratulations on passing all the tests, including the bonus test!

- I like the use of `unicode-segmentation`

This can also be...
```rust

use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    input.graphemes(true).rev().collect()
}
```

since the [last expression can be
returned](https://doc.rust-lang.org/rust-by-example/fn.html) from a function
without using `return` and a semicolon.

If you ever care to, you may want to check out the
[unicode-reverse](https://crates.io/crates/unicode-reverse) crate as another
possible approach to this exercise, especially for passing the bonus test.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
