Congratulations on passing all the tests!

- I like the Operation enum.

- I like the use of match statements.

- I like the use of comments

- I like the code is broken up into functions instead of being one big blob.

If you care to, you may try getting it to pass another test of my own which is a
bit more complicated.

```rust
//would handle an extra wrinkle in this test
fn can_use_different_words_with_the_same_name_2() {
    let mut f = Forth::new();
    assert!(f.eval(": foo 5 ;").is_ok());
    //define an existing macro by existing macro
    assert!(f.eval(": bar foo ;").is_ok());
    //redefine an existing macro with a new value
    assert!(f.eval(": foo 6 ;").is_ok());
    // new! - redefine an existing macro with an existing macro
    assert!(f.eval(": bar foo ;").is_ok());
    assert!(f.eval("bar foo").is_ok());
    assert_eq!(vec![6, 6], f.stack());
}
```

Most, but not all, solutions I've seen pass that extra test, but it's not
necessary to do so. I just made the test up because I was curious, and I had to
modify my own initial solution to pass it.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
