Good job on passing all the tests!

 * I like the use of macros.
 * It's good that you factorize the duplicate functions.

You can reduce the duplication of code by either:
 * Implementing a function common to all three structures and call it from
   their respective `with_attrs` method.
 * Using macros to implement `with_attrs` automatically.
