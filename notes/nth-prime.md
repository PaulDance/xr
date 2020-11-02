Congratulations on passing all the tests!

- I like that this solution is succinct and readable.

FYI, I benchmarked `test_big_prime` and got a quite respectable result. Most
I've seen are usually ~100 milliseconds. Some have been ~7 milliseconds and
some ~2 milliseconds. The fastest solution I've seen used
[lazy-static](https://crates.io/crates/lazy_static).

This solution:

```rust
test test_big_prime ... bench:     146,102 ns/iter (+/- 4,064)
```

Elsewhere:

```rust
test test_big_prime ... bench:          33 ns/iter (+/- 1) //used lazy-static
test test_big_prime ... bench:     146,102 ns/iter (+/- 4,064) //used bit-vec and num-traits
test test_big_prime ... bench:   2,182,920 ns/iter (+/- 134,698)
test test_big_prime ... bench:   2,602,515 ns/iter (+/- 495,067)
test test_big_prime ... bench:   6,513,670 ns/iter (+/- 341,713)
test test_big_prime ... bench:   6,795,435 ns/iter (+/- 358,389)
test test_big_prime ... bench:   7,133,170 ns/iter (+/- 210,666)
test test_big_prime ... bench: 102,529,500 ns/iter (+/- 471,065)
test test_big_prime ... bench: 115,545,770 ns/iter (+/- 713,573)
test test_big_prime ... bench: 115,228,610 ns/iter (+/- 4,127,825)
test test_big_prime ... bench: 116,127,410 ns/iter (+/- 5,185,981)
```

One tip for finding out if a number is prime is that when testing if a number
can be divided by a prime, if a prime less than or equal to the number's square
root will not divide into the number, then the number won't be divisible by a
greater prime. [The
explanation](https://stackoverflow.com/questions/5811151/why-do-we-check-up-to-the-square-root-of-a-prime-number-to-determine-if-it-is-pr?rq=1).
Stopping at the square root can save a lot of time.

Since all tests passed, I'm approving this solution. If you care to, you may
submit another solution refactored for performance.  You may find ideas for
other approaches by viewing the community solutions. These two solutions are
public, use no special crate, and are about 7 milliseconds:
[fast](https://exercism.io/tracks/rust/exercises/nth-prime/solutions/d18ccf50aee84240a9620e53c6bb2579)
and
[fast](https://exercism.io/tracks/rust/exercises/nth-prime/solutions/a50dd590cd5d405b9338d7782f1ce4cb)
