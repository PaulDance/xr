Congratulations on passing all the tests!

If you cared to, for further exercise, you might try an 
[iter](https://doc.rust-lang.org/std/primitive.slice.html#method.iter),
a [map](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.map) and a
[collect](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.collect). 
Using a list of 
[tuples](https://doc.rust-lang.org/stable/rust-by-example/primitives/tuples.html)
to iterate over, e.g. `(3, "Pling")`, would work well with that approach. There 
are other ways that a `match` on a `tuple` could work, for example...

```rust
pub fn raindrops(n: u32) -> String {
    let output = match (n % 3 == 0, n % 5 == 0, n % 7 == 0) {
        (true, false, false) => "Pling",
        // and so on
```

Viewing the community solutions may offer other approaches to this exercise 
which you may find interesting.

Strings and slices can be confusing for anyone who knows another language, since
what looks like a
[String](https://doc.rust-lang.org/std/string/struct.String.html) literal is
actually a [str](https://doc.rust-lang.org/std/primitive.str.html). When
processed in
[Iterators](https://doc.rust-lang.org/std/iter/trait.Iterator.html), the
`String` can become borrowed, at which point it becomes a reference to a String
(&String). If many iterators are chained, then a `String` can become a `&String`
which can become a `&&String` and so on, depending on the type of iterator.

Line 11 is needed in this particular solution because
[flatten](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.flatten)
creates references to Strings (&String), and
[collect](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.collect)
won't make a String out of &String. You can see that `flatten` creates a
reference in the first `flatten` example of two vectors being flattened into a
reference to one vector.

```rust
let data = vec![vec![1, 2, 3, 4], vec![5, 6]];
let flattened = data.into_iter().flatten().collect::<Vec<u8>>();
assert_eq!(flattened, &[1, 2, 3, 4, 5, 6]);
```

If you're not already using an LSP (Language Server Protocol) implementation
such as [rls](https://github.com/rust-lang/rls) or
[rust-analyzer](https://rust-analyzer.github.io/), you may find that using one
will help, as it will annotate the types for you.

A discussion of String, &String, str and &str is
[here](https://users.rust-lang.org/t/whats-the-difference-between-string-and-str/10177).
Especially pay attention to what Steve Klabnik has to say about it.

It is certainly idiomatic to take a functional approach to solving an exercise
in Rust. In the case of this solution, I think there is a lot more
ceremony/verbosity than needed.

I think you're very close to a succinct and readable solution with the array of
tuples approach. I think it can be simplified to

```rust
[(3, "Pling"), (5, "Plang"), (7, "Plong")]
```

Hint: Start with just that, and all you need is an
[iter](https://doc.rust-lang.org/std/primitive.slice.html#method.iter), a
[map](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.map) and a
[collect](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.collect),
followed by an `if-else`.
