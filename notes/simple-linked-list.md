Congratulations on passing all the tests!

 * I like this solution is succinct and readable.
 * I like this solution uses a `length` field that's updated in `push` and
   `pop`, so the `len` function doesn't need to calculate.

Since `Option<Box<Node<T>>>` occurs in both the `Node` and `SimpleLinkedList`
structs, another approach might be to create a type for that which would be
used for `next` and `head`, so the type for the two related fields is defined
in one place.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
