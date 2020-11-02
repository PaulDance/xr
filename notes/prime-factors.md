Congratulations on passing all the tests!

I like this solution is succinct and readable.

I benchmarked this solution and it is toward the low end of what I've seen so far..
This solution:

```rust
test test_factors_include_large_prime ... bench:   2,210,295 ns/iter (+/- 170,206)
```

Elsewhere

```rust
test test_factors_include_large_prime ... bench:     978,612 ns/iter (+/- 425,057)
test test_factors_include_large_prime ... bench:  32,514,960 ns/iter (+/- 423,109)
```
