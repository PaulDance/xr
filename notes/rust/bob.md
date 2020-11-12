Congratulations on passing all the tests!

Perhaps consider using what only comes with the std library for a solution,
although it is good to be comfortable with leveraging dependencies,
particularly regex.

There are essentially four conditions to check. Perhaps consider an approach
where a tuple of four elements is checked in a `match` expression. You might
get an idea from
[here](https://stackoverflow.com/questions/39159857/matching-tuples-with-multiple-possible-values)
or [here](https://riptutorial.com/rust/example/13733/matching-tuple-values).
This can be done without using `regex`, for example:

```rust
pub fn reply(message: &str) -> &str {
    match (
        message.trim_end().is_empty(),
        message.trim_end().ends_with("?"),
        message.chars().all(|chr| chr.is_uppercase()),
        message.chars().any(|chr| chr.is_alphabetic()),
    ) {
        (true, _, _, _) => "Fine. Be that way!",
        (_, true, true, true) => "Calm down, I know what I'm doing!",
        (_, false, true, true) => "Whoa, chill out!",
        (_, true, _, _) => "Sure.",
        _ => "Whatever.",
    }
}
```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
