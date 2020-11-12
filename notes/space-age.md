Congratulations on passing all the tests!

 * I like the use of a constant.

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
