Congratulations on passing all the tests!

 * I like this solution is succinct and readable, with almost-always
   informative names for the bindings.
 * I like that you derive the `PartialEq` on `Dna` and `Rna` instead if
   implementing it manually.

One thing I noticed was:

```rust
#[derive(Debug, PartialEq)]
pub struct Dna(String);
```

which leaves referring to the struct field as if it were a tuple, for example:

```rust
Rna(self.0.chars()...
```

which makes it less informative, as if it were a magic number, when it doesn't
have to be.

Something to consider is that the logic needed to create correct values in the
`new` methods would be bypassed if someone were to create Dna or Rna as a struct
literal, for example:

```rust
let my_Dna = Dna {0: "ACGT"};
```

Ways to prevent the creation of a struct literal are described in [this article
by Steve
Klabnik](https://steveklabnik.com/writing/structure-literals-vs-constructors-in-rust).
I think what he suggests wouldn't pass the tests, since the tests don't call
Dna/Rna nested inside another modular scope, but it would be a good thing to
consider if making your own library for other people to use. As the author writes: 
"To me, understanding things like this is when I really start to feel like I’m getting
to know a language: putting three or four disparate concepts together to achieve some 
goal. It’s when a language stops being a bunch of disjoint parts and starts becoming 
a cohesive whole."
