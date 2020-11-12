Congratulations on passing all the tests!

 * I like that this solution is succinct and mostly readable.
 
A quibble is with having `Some` return an `Err` and `None` return an `Ok` being
a bit counter-intuitive and it could confuse a future maintainer on the first
read.

```rust
match dna.chars().find(|&x| !VALID_NUCLEOTIDES.contains(x)) {
    Some(e) => Err(e),
    None => Ok(dna.chars().filter(|&x| x == nucleotide).count()),
}
```

To pick up from how `nucleotide` is validated, I might, if I were that future
maintainer, prefer

```rust
for c in dna.chars() {
    if !VALID_NUCLEOTIDES.contains(c) {
        return Err(c);
    }
}

Ok(dna.chars().filter(|&x| x == nucleotide).count())
```

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
