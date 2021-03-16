Good job on passing the tests!

 * You show good use of iterators in `annotate`.
 * It's good that you use `char::from_digit` in order to avoid unnecessary
   additional heap allocation for just one character.
 * I like that you generate surrounding positions instead of manually listing
   them.

`char::from_digit` is available in order to simplify the conversion of an
integer to a single character without manual byte handling or string
intermediate storage which requires unnecessary additional allocation.

It is possible to simplify the mine counting by generating surrounding
positions using iterators instead of manually listing them.

Consider implementing a `count_mines` function that returns the number of mines
surrounding a given position of the field by generating the neighboring
positions, then you can simply apply it to the field using iterators with
enumerates, maps and collects. Use `str::as_bytes` in order to get
constant-time access to neighboring characters.

Your solution performs okay. I ran a few benchmarks based on the `large_board`
unit test on my machine and got the following results:

@insideoutclub's solution using iterators only:

```rust
test large_board ... bench:         919 ns/iter (+/- 65)
```

130eb5be1617412e9511035abf543034 -- @sputnik's solution using iterators only:

```rust
test large_board ... bench:         640 ns/iter (+/- 12)
```

My solution using iterators and manual listing with ugly conversions:

```rust
test large_board ... bench:       2,456 ns/iter (+/- 136)
```

Your solution:

```rust

```

Note that I've had a similar situation recently, where another student
submitted a solution even faster than yours from my tests, even though it used
additional allocation. The student then ran the benchmark on his machine and
revealed the solution to be 10% slower than @insideoutclub's. You should
therefore run the benchmark on your machine as well to get a conclusive result.
