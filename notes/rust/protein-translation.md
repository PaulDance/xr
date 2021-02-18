Your solution:

```rust

```

My solution using a `HashMap` to store pairs:

```rust
test bench_pairs ... bench:       1,457 ns/iter (+/- 62)
```

@BPoserow's solution just using the given `Vec`:

```rust
test bench_pairs ... bench:          65 ns/iter (+/- 3)
```

Note that a clone of the pairs vector is included in each iteration.
