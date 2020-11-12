Congratulations on passing all the tests, including the bonus test!

 * I like the use of `unicode-segmentation`

This can also be:

```rust
use unicode_segmentation::UnicodeSegmentation;

pub fn reverse(input: &str) -> String {
    input.graphemes(true).rev().collect()
}
```

You don't need to use `return` since the [last expression can be
returned](https://doc.rust-lang.org/rust-by-example/fn.html) from a function
without using `return` and a semicolon.

If you want to try the bonus task concerning grapheme clusters, I suggest you
take a look at the
[`unicode-segmentation`](https://crates.io/crates/unicode-segmentation) crate.

If you ever care to, you may want to check out the
[unicode-reverse](https://crates.io/crates/unicode-reverse) crate as another
possible approach to this exercise, especially for passing the bonus test.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
