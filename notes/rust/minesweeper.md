Consider implementing a `count_mines` function that returns the number of mines
surrounding a given position of the field, either by manually listing or
generating the neighboring positions, then you can simply apply it to the field
using iterators with enumerates, maps and collects.

Your solution is indeed a bit slow. I ran a few benchmarks based on the
`large_board` unit test on my machine and got the following results:

@insideoutclub's solution using iterators only:

```rust
test large_board ... bench:         919 ns/iter (+/- 65)
```

My solution using iterators and manual listing with ugly conversions:

```rust
test large_board ... bench:       2,456 ns/iter (+/- 136)
```

Your solution:

```rust

```
