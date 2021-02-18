Congratulations on passing all the tests!

I benchmarked and the results were the slowest I've seen.

This solution:

```rust

```

Elsewhere:

```rust
test identify_all_saddle_points ... bench:         274 ns/iter (+/- 16)
test identify_all_saddle_points ... bench:         364 ns/iter (+/- 34)
test identify_all_saddle_points ... bench:         473 ns/iter (+/- 68)
test identify_all_saddle_points ... bench:         572 ns/iter (+/- 90)
test identify_all_saddle_points ... bench:         802 ns/iter (+/- 644)
test identify_all_saddle_points ... bench:       1,065 ns/iter (+/- 309)
test identify_all_saddle_points ... bench:       1,072 ns/iter (+/- 102
test identify_all_saddle_points ... bench:       1,109 ns/iter (+/- 142)
```

The key to maximizing performance is to do as much in each iterator in as few
iterators as possible. Or I should say to do as little as neeeded in each
iterator in as few iterators as possible.

This exercise can be solved with only a couple vectors and no HashMaps or
HashSets. I'm not sure that the overhead of the Matrix struct helps performance.
But it is fine to have a bit slower performance if the code is more readable for
you.

Since this passed all the tests I'm approving the solution. If you ever care to
you may submit a solution refactored to be more performant. Viewing the
community solutions may offer other approaches to this exercise which you may
find helpful.
