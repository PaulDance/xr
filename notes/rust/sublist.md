Congratulations on passing all the tests!

Another way to look for sublists would be to make use of the
[windows](https://doc.rust-lang.org/std/primitive.slice.html#method.windows)
function for slice.

Any `if-else` expressions could also be `match` expressions, possibly with [match
guards](https://doc.rust-lang.org/stable/rust-by-example/flow_control/match/guard.html).
Many community solutions use a `match` on a tuple of the list1 and list2
lengths.

I benchmarked this solution and the result was quite respectable. Most are in
the high 20 nanoseconds. Two were 10 nanoseconds, which used the `windows`
function. One was 5 nanoseconds, which did not use the `windows` function.

```rust

```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
