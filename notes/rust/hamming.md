Congratulations on passing all the tests!

 * I like the match on a tuple.

As formattted, it may be a bit less readable than a maintainer would like to
come back to in a few months to modify.

`rustfmt` on my machine makes it a bit more readable by not extending the lines
so far to the right

```rust
/// Return the Hamming distance between the strings,
/// or None if the lengths are mismatched.
pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    match (
        s1.chars().collect::<Vec<char>>(),
        s2.chars().collect::<Vec<char>>(),
    ) {
        (vec1, vec2) if vec1.len() != vec2.len() => None,
        (vec1, vec2) => Some((0usize..(vec1.len())).fold(0usize, |acc, x| {
            acc + if vec1[x] != vec2[x] { 1 } else { 0 }
        })),
    }
}
```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
