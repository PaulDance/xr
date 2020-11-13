Congratulations on passing all the tests!

 * I like the large numeric is formatted with underscores to be more readable.
 * I like this solution directly adds `Duration` to `start` with the `+`
   operator.
 * I like the expression is directly returned instead of being set to a binding
   and returning the binding or using `return` and a semicolon.

A minor style point is that usually `rustfmt`  will usually put `use` elements
in alphabetical order. In larger programs with a lot of `use` statements it can
be helpful to have them ordered alphabetically.

Some coders may prefer to create a `const` with the gigasecond value and use
that in `after`. I could see doing that if the value were used in multiple
places, but since it's only used in one place in this short program I don't
think it's really needed, though it's fine to do so. Note that using a constant
does not slow down the program as they are basically inlined, which is not the
case for static values. The [RFC
246](https://github.com/rust-lang/rfcs/blob/master/text/0246-const-vs-static.md)
that (re)introduced constants, a section of the [Rust
book](https://doc.rust-lang.org/book/ch03-01-variables-and-mutability.html#differences-between-variables-and-constants)
and one of the
[examples](https://doc.rust-lang.org/stable/rust-by-example/custom_types/constants.html)
address differences between the two concepts.

You should however avoid the use of `pow` but rather write out the constant
entirely like so: `1_000_000_000`. Underscores in big numbers like this help
improving the readability quite a bit.

You may find 
[chrono::NaiveTime](https://docs.rs/chrono/0.4.19/chrono/naive/struct.NaiveTime.html) 
with [chrono::Duration](https://docs.rs/chrono/0.4.19/chrono/struct.Duration.html)
to be helpful with the `Clock` exercise.

Since this passed all the tests I can approve it if you want to let it stand as
is, or you can submit a refactored solution which uses less ceremony if you
wish.
