You can reduce the duplication of code by either:
 * Implementing a function common to all three structures and call it from
   their respective `with_attrs` method.
 * Using macros to implement `with_attrs` automatically.
