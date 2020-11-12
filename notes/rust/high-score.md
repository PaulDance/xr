Congratulations on passing all the tests!

 * I like the solution is succinct and readable.
 * I like that `personal_best` reuses `personal_top_three`.
 * I like that you used a `match` expression.

`personal_top_three` could be handled by the
[min](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.min)
function.

```rust
pub fn personal_top_three(&self) -> Vec<u32> {
    let mut tmp = self.scores.to_vec();
    tmp.sort();
    tmp.reverse();
    tmp[0..min(3, tmp.len())].to_vec()
}
```

`latest` could be a match expression on `scores.is_empty()`, returning `None`
if `true` or `Some(self.scores[self.scores.len() - 1])`. Or, even simpler,
scores.[last()](https://doc.rust-lang.org/std/primitive.slice.html#method.last).copied(),
since the last function returns an Option or the last element. Also, you may
already know that for primitives `copied` and `cloned` both [return the same
value](https://doc.rust-lang.org/std/marker/trait.Copy.html#whats-the-difference-between-copy-and-clone),
so it also could be `self.scores.last().cloned()`.

`personal_best` could be simplified by the
[max](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.max)
function.

```rust
pub fn personal_best(&self) -> Option<u32> {
    match self.nums.iter().max() {
        None => None,
        Some(val) => Some(*(val)),
    }
}
```

`personal_top_three` could be simplified by the
[min](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.min)
function.

```rust
pub fn personal_top_three(&self) -> Vec<u32> {
    let mut tmp = self.scores.to_vec();
    tmp.sort();
    tmp.reverse();
    tmp[0..min(3, tmp.len())].to_vec()
}
```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
