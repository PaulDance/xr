Congratulations on passing all the tests!

 * I like the use of a constant.

In case you would like to only define a function or method required to be
implemented in a trait, then you should terminate the definition with a
semi-colon instead of leaving the default implementation that calls
`unimplemented!`, which is basically a more specific version of `panic!`.

One thing you could do is to define an associated constant in the `Planet`
trait and provide a default implementation for `years_during`, which would help
you avoid all the re-implementions of `years_during` for every planet, as they
are very similar. The edition guide has a section about [trait associated
constants](https://doc.rust-lang.org/nightly/edition-guide/rust-2018/trait-system/associated-constants.html)
and the book about [default
implementations](https://doc.rust-lang.org/book/ch10-02-traits.html#default-implementations)
which you should take a look at.

Another approach to consider is how the use of a macro could reduce the
boilerplate for this exercise. For instance, [a macro can implement a trait for
multiple types at
once](https://stackoverflow.com/questions/39150216/implementing-a-trait-for-multiple-types-at-once),
though it is fine to implement `years_during` in the Planet trait itself. In the
community solutions you may see a macro defining both the structs and their
implementations.

Info to get started with macros can be found
[here](https://doc.rust-lang.org/rust-by-example/macros/syntax.html) and
[here](https://doc.rust-lang.org/1.7.0/book/macros.html).

You may want to view the community solutions for examples of how a macro can be
used to reduce the boilerplate.
