Congratulations on passing all the tests!

- I like this solution is succinct and readable.

- I like the use of constants.

- I like the use of `match`.

- I like that Some and None are used instead of
  [unwrap](https://doc.rust-lang.org/stable/rust-by-example/error/option_unwrap.html).
  Not that using `unwrap` is not always wrong, but I like that the code shows a
  comfort with using Options instead of immediately dereferencing them. In this
  solution it goes to graceful handling of the braces and when there is nothing
  left to pop.

Did you consider using a match in `is_correct_closing_brace`?

```rust
pub fn is_correct_closing_brace(open: char, close: char) -> bool {
    match (open, close) {
        (SQUARE_OPEN, SQUARE_CLOSE) => true,
        (CURLY_OPEN, CURLY_CLOSE) => true,
        (ROUND_OPEN, ROUND_CLOSE) => true,
        _ => false,
    }
}
```

Also, since it is a helper function, `is_correct_closing_brace` can be private
(i.e., no `pub`.)

This:

```rust
    if open_brace_stack.len() == 0 {
        return true;
    }
    false

```

could be just

```rust
    open_brace_stack.len() == 0
```

There are many idiomatic ways to solve this exercise. For
[example](https://exercism.io/tracks/rust/exercises/matching-brackets/solutions/076fbed49bd74c47a34ae3182bf69c4c):
wanted to create and implement a trait, even though it was not at all necessary
to do so.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
