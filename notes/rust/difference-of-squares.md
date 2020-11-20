I ran a few benchmarks for each function. In each iteration, I ask the bencher
to run the benchmarked function with `n` traversing the `(1000..=10_000)` range
in order to disable compiler optimizations.

@hamuz' solution using constant formulae:

```rust
test test_difference_range     ... bench:      17,106 ns/iter (+/- 1,457)
test test_square_of_sum_range  ... bench:      14,101 ns/iter (+/- 1,209)
test test_sum_of_squares_range ... bench:      13,652 ns/iter (+/- 823)
```

@rafaelalvessa's solution using sums on iterators:

```rust
test test_difference_range     ... bench:      21,937 ns/iter (+/- 826)
test test_square_of_sum_range  ... bench:      13,693 ns/iter (+/- 957)
test test_sum_of_squares_range ... bench:      16,999 ns/iter (+/- 625)
```

Your solution:

```rust

```
