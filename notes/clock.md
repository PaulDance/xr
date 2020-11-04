Congratulations on passing all the tests!

- I like the use of constants.

- I like that `PartialEq` was derived instead of implementing it manually.

- I like the use of `{:02}:{:02}` instead of calculating the leading zero manually.

- I like the use of `rem_euclid`.

- I like that Clock only stores minutes.

Something to consider is how the logic may possibly be simplified by storing
only minutes in the Clock struct.

Instead of manually implementing `PartialEq`, it can be derived in an attribute.
This poses no problems for the Clock struct since all of its fields are
primitive values.

Instead of `%` or `/`, we can consider using the integer method
[rem_euclid](https://doc.rust-lang.org/std/primitive.i32.html#method.rem_euclid)
which returns non-negative results, or
[div_euclid](https://doc.rust-lang.org/std/primitive.i32.html#method.div_euclid)
for Euclidean division. These were made stable in Rust 1.38.

Another approach to consider would be to use [[chrono::NaiveTime](https://docs.rs/chrono/0.4.19/chrono/naive/struct.NaiveTime.html)] with [[chrono::Duration](https://docs.rs/chrono/0.4.19/chrono/struct.Duration.html)] . The `chrono` crate was introduced in the Gigasecond exercise.

Another thing to consider is how the `Clock::new` function could be bypassed by
initializing from a Clock literal, like so...

```rust
let my_Clock = Clock {hours: -24, minutes:-1440};
```

There is an article on [struct literals and
constructors](https://steveklabnik.com/writing/structure-literals-vs-constructors-in-rust)
that explains how to prevent initialization by a struct literal. The struct
literal concerns are not specifically related to this exercise but are to be
considered when using structs in your own projects.

I've gone ahead and added the `num-integer` dependency, but in the future, when
using an external crate, please include your `Cargo.toml` file with your
submission like so

```bash
exercism submit Cargo.toml src/lib.rs
```
