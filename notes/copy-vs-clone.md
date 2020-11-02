For primitives `copied` and `cloned` [return the same
value](https://doc.rust-lang.org/std/marker/trait.Copy.html#whats-the-difference-between-copy-and-clone).

[Clone](https://doc.rust-lang.org/std/clone/trait.Clone.html) differs from
Copy in that Copy is implicit and extremely inexpensive, while Clone is always
explicit and may or may not be expensive. In order to enforce these
characteristics, Rust does not allow you to reimplement Copy, but you may
reimplement Clone and run arbitrary code.

Since Clone is more general than Copy, you can automatically make anything Copy
be Clone as well.

Copies happen implicitly, for example as part of an assignment y = x. The
behavior of Copy is not overloadable; it is always a simple bit-wise copy.

Cloning is an explicit action, x.clone(). The implementation of Clone can
provide any type-specific behavior necessary to duplicate values safely. For
example, the implementation of Clone for String needs to copy the pointed-to
string buffer in the heap. A simple bitwise copy of String values would merely
copy the pointer, leading to a double free down the line. For this reason,
String is Clone but not Copy.

Clone is a supertrait of Copy, so everything which is Copy must also implement
Clone. If a type is Copy then its Clone implementation only needs to return
*self.
