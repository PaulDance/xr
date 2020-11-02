Congratulations on passing all the tests!

I like this solution is well-commented.

I like that the logic cascades down. This is probably more readable than a more
succinct but perhaps less readable solution, such as

This is more succinct, but perhaps less readable...
```rust
#[macro_export]
macro_rules! hashmap {
    ($($( $key: expr => $val: expr )+$(,)?)*) => {{
         let mut map = ::std::collections::HashMap::new();
         $($( map.insert($key, $val); )*)*
         map
    }}
}
```

The inside pattern is saying to match one or more of key=>val with zero or one
comma after it. The outside pattern is saying there could be zero or more of the
inside pattern, which takes care of `test_empty`.
