Congratulations on passing all the tests!

 * I like the use of `checked_rem` in a match expression, although it is not
   strictly necessary.

I bench-tested using the arguments for
`solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3` and
the results were slower than expected.

This solution:

```rust
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:     349,860 ns/iter (+/- 193,273)This 
```

Elsewhere:

```rust
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:      24,630 ns/iter (+/- 3,750)
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:      25,587 ns/iter (+/- 7,862)
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:      33,813 ns/iter (+/- 694)
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:      33,826 ns/iter (+/- 667)
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:      34,366 ns/iter (+/- 5,510)
test solutions_using_include_exclude_must_extend_to_cardinality_greater_than_3 ... bench:     331,895 ns/iter (+/- 59,856)
```

I usually find that solutions using a HashSet are slower than those which do
not. The key to performance is to do as little as needed in each iterator and
use as few iterators as possible.

I suggest swapping the nested `for` loops with
[iterators](https://doc.rust-lang.org/std/iter/trait.Iterator.html) such as
[filter](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.filter).

Since all tests passed I'm approving this solution, but, if you care to, you
may want to try an approach that optimizes performance. Viewing the community
solutions may yield some ideas. Here is @bobahop's solution, which, at about 25
microseconds, can still probably be improved upon.

```rust
pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    match factors.contains(&0u32) {
        false => (1..limit)
            .filter(|num| factors.iter().any(|factor| num % *factor == 0))
            .sum(),
        true => (1..limit)
            .filter(|num| {
                factors
                    .iter()
                    .any(|factor| factor > &0u32 && num % *factor == 0)
            })
            .sum(),
    }
}
```
