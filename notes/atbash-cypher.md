Congratulations on passing all the tests!

- I like this solution uses iterators.

- I like this solution uses a macro and includes a test for it.

- I like this approach uses iterators and match expressions.

- I like this approach uses an `reverse` function instead of doing comparisons
  with collections such as a HashMap, Vector of tuples, or arrays.

- I like the use of constants.

A quibble is that instead of always adding 1 here

```
(elem as u8 - A_ASCII) as i32 + 1)
```

It might be a bit more performant for ASCII to be one less and named differently.

If you care to, for further exercise, you could try an approach without the
`regex` dependency. The `regex` crate is [not as robust as other
languages](https://github.com/rust-lang/regex/issues/127).

Rust is very constraining when it comes to static or const bindings.
Processing/mutability in a function to generate a value for a static or const
is not allowed on the stable toolchain. The closest I could find to a
persistent look-up was an array literal.

```rust
// need to make a reference to the array, which is the size of a pointer,
// otherwise the compilation error message:
// the size for values of type `[(char, char)]` cannot be known at compilation time
// the trait `std::marker::Sized` is not implemented for `[(char, char)]`
// to learn more, visit <https://doc.rust-lang.org/book/ch19-04-advanced-types.html#dynamically-sized-types-and-the-sized-trait>
// example: this will only pass the first test
const DICT: &[(char, char)] = &[('y', 'b'), ('e', 'v'), ('s', 'h')];
```

Typing can be greatly reduced by only defining the a-z tuples. Uppercase,
numeric, and z-a tuples do not have to be defined with the use of accomodating
logic, such as
[retain](https://doc.rust-lang.org/std/string/struct.String.html#method.retain)
with
[is_alphanumeric](https://doc.rust-lang.org/std/primitive.char.html#method.is_ascii_alphanumeric)
and
[to_lowercase](https://doc.rust-lang.org/std/primitive.char.html#method.to_lowercase).
[find](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.find)
could be called on an iter of the lookup when in a map function to change the
value between `tuple.0` or `tuple.1` depending on encoding or decoding.

Since this solution passed all the tests I can approve it if you want to let it
stand as is, or you can submit a refactored solution if you wish. Please let me
know if you have any further questions.

- - - - - - - - - - - - -

Here are some resources I looked at when trying to make it work as is.

[Return a map iterator](https://stackoverflow.com/questions/31904842/return-a-map-iterator-which-is-using-a-closure-in-rust)

[Return an iterator from a function](https://stackoverflow.com/questions/27646925/how-do-i-return-a-filter-iterator-from-a-function)

This is a resource you may find helpful in learning more about the details of lifteimes, ownership and borrowing in Rust.
[article on lifetimes](https://fasterthanli.me/articles/i-am-a-java-csharp-c-or-cplusplus-dev-time-to-do-some-rust)
