Congratulations on passing all the tests!

- I like the large numeric is formatted with underscores to be more readable.

- I like this solution directly adds `Duration` to `start` with the `+` operator.

- I like the expression is directly returned instead of being set to a binding
  and returning the binding or using `return` and a semicolon.

A minor style point is that usually `rustfmt`  will usually put `use` elements
in alphabetical order. In larger programs with a lot of `use` statements it can
be helpful to have them ordered alphabetically.

Some coders may prefer to create a `const` with the gigasecond value and use
that in `after`. I could see doing that if the value were used in multiple
places, but since it's only used in one place in this short program I don't
think it's really needed, though it's fine to do so. I'm told by several people
that [cargo-asm](https://crates.io/crates/cargo-asm) shows that either way
compiles into the same assembly instructions.

You may find 
[chrono::NaiveTime](https://docs.rs/chrono/0.4.19/chrono/naive/struct.NaiveTime.html) 
with [chrono::Duration](https://docs.rs/chrono/0.4.19/chrono/struct.Duration.html)
to be helpful with the `Clock` exercise.

Since this passed all the tests I can approve it if you want to let it stand as
is, or you can submit a refactored solution which uses less ceremony if you
wish.
