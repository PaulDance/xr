My solution using the primitive-generating tree:

```rust
test test_triplets_for_large_number ... bench:      38,634 ns/iter (+/- 8,644)
```

@aurelien-naldi's solution testing a lot of possibilities:

```rust
test test_triplets_for_large_number ... bench:  99,190,440 ns/iter (+/- 6,154,965)
```

@ParceledTongue's solution exploring about half less possibilities and avoiding
the last clone of a filtered triplet:

```rust
test test_triplets_for_large_number ... bench:  51,923,436 ns/iter (+/- 6,256,791)
```
