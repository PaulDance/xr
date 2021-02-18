Congratulations on passing all the tests!

I benchmarked this solution and the result was slower than expected.

This solution:

```rust

```

Elsewhere:

```rust
test test_valid_number_with_an_odd_number_of_spaces ... bench:         866 ns/iter (+/- 644)
test test_valid_number_with_an_odd_number_of_spaces ... bench:         309 ns/iter (+/- 29)
test test_valid_number_with_an_odd_number_of_spaces ... bench:         191 ns/iter (+/- 12)
test test_valid_number_with_an_odd_number_of_spaces ... bench:          41 ns/iter (+/- 7)
test test_valid_number_with_an_odd_number_of_spaces ... bench:          26 ns/iter (+/- 1)
test test_valid_number_with_an_odd_number_of_spaces ... bench:          18 ns/iter (+/- 2)
```

I think using the `filter_map` and two `map`s are taking more time than needed.

Since this passed all the tests I'm approving it. If you ever care to, you may
want to view the community solutions for ideas on a more performant approach to
later submit a refactored solution.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
