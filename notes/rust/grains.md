Congratulations on passing all the tests!

I benchmarked this solution. It was among the fastest.

This solution:

```rust

```

Here is another 0 nanosecond solution which uses less ceremony:

```rust
pub fn square(s: u32) -> u64 {
    if (s < 1) | (s > 64) {
        panic!("Square must be between 1 and 64");
    }
    return 2_u64.pow(s - 1);
}

pub fn total() -> u64 {
    (2u128.pow(64) - 1) as u64
}
```

Other solution benchmarks:

```rust
test test_returns_the_total_number_of_grains_on_the_board ... bench:           1 ns/iter (+/- 0)
test test_returns_the_total_number_of_grains_on_the_board ... bench:         224 ns/iter (+/- 32)
test test_returns_the_total_number_of_grains_on_the_board ... bench:         466 ns/iter (+/- 23)
test test_returns_the_total_number_of_grains_on_the_board ... bench:         466 ns/iter (+/- 25)
test test_returns_the_total_number_of_grains_on_the_board ... bench:         563 ns/iter (+/- 32)
test test_returns_the_total_number_of_grains_on_the_board ... bench:       2,954 ns/iter (+/- 406)
```

To coerce a larger type to a smaller type, use
[as](https://doc.rust-lang.org/1.30.0/book/first-edition/casting-between-types.html).

```rust
pub fn total() -> u64 {
    (2u128.pow(64) - 1) as u64
}
```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
