There is actually nothing wrong in using `.map(|x| *x)`: it's usually done with
`.copied()`, which is not exactly the same as `.cloned()`. `cloned` does
something in the likes of `.map(|x| x.clone())`, thus requiring only `Clone` to
be implemented, while `copied` is more `.map(|x| *x)`: `Copy` is required as
well this time.

Therefore I would recommend you use `copied` or `cloned` in this kind of
situation as it enables going from `&T` to `T` when `Clone` or `Copy` (more
restrictive) is implemented, but also from `&&T` to `&T` without any copy or
clone performed, just pure dereferencing.

Consider the following program:

```rust
#[derive(Debug)]
struct A(u8);

pub fn main() {
    let v = [A(1), A(2), A(3)];
    dbg!(v.iter().collect::<Vec<&A>>());
}
```

simply displaying:

```rust
[main.rs:6] v.iter().copied().collect::<Vec<&A>>() = [
    A(
        1,
    ),
    A(
        2,
    ),
    A(
        3,
    ),
]
```

`v` is an array holding values. When you call `iter` is produces an iterator
over references to values, while `into_iter` is the same, contrary to other
collections like `Vec`, much like when dealing with slices. Note that I'm
specifying the entire `Vec<&A>` specific type in order to check the time of the
iterator elements.

Now if you try to dereference to values using `copied` like so:

```rust
#[derive(Debug)]
struct A(u8);

pub fn main() {
    let v = [A(1), A(2), A(3)];
    dbg!(v.iter().copied().collect::<Vec<A>>());
}
```

the compiler spits:

```rust
error[E0277]: the trait bound `A: std::marker::Copy` is not satisfied
 --> main.rs:6:19
  |
6 |     dbg!(v.iter().copied().collect::<Vec<A>>());
  |                   ^^^^^^ the trait `std::marker::Copy` is not implemented for `A`
```

which was expected because `A` only implements `Debug` in order to display it
easily, but not `Copy`. Now if you turn `v` into an array of references:

```rust
#[derive(Debug)]
struct A(u8);

pub fn main() {
    let v = [&A(1), &A(2), &A(3)];
    dbg!(v.iter().copied().collect::<Vec<&A>>());
}
```

then it compiles successfully and yields the same result. Again, we are sure we
turned an iterator of `&&A` into only `&A` because `Vec<&A>` is specified. The
exact same it true for `cloned`.
