Congratulations on passing all the tests!

Another approach to this exercise would be to use a
[match](https://doc.rust-lang.org/reference/expressions/match-expr.html)
expression. [Match](https://doc.rust-lang.org/book/ch06-02-match.html) are
idiomatic and are often less verbose than `if-else` expressions.

Here's another example of a `match` expression adapted from the most-starred
community solution:

```rust
pub fn is_leap_year(year: u64) -> bool {
    match (year % 4, year % 100, year % 400) {
        (0, 0, 0) => true,
        (0, 0, _) => false,
        (0, _, _) => true,
        (_, _, _) => false,
    }
}
```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
