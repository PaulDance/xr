Congratulations on passing all the tests!

- I like the use of enums.

- I like the code is broken up into functions instead of being one big blob.

- I like the use of the `'a` lifetime specifier and that it was not sprinkled everywhere.

- I like the derivations of `PartialEq` and `PartialOrd` etc. instead of
  manually implementing them.

- I like the use of custom tests.

- I like the creation and use of a macro.

- I like the comments.

- I like this solution demonstrates a familiarity with itertools.

- I like the familiarity with `unreachable!`

As a style issue, perhaps some of the `if` expressions could be `match`
expressions, but that's just a quibble.

A further challenge would be to see if the solution can be made even more
concise. I think the shortest solutions I've seen were about 150 LOC, but they
were not necessarily the most readable.

There are many ways to implement a solution for this exercise. Some solutions
will use one or more enums. For instance, there may be an enum that defines the
type of hand (StraightFlush, FourofaKind, etc.)

Some solutions derive PartialOrd instead of implementing it manually.

The Card struct holds the suit, but, except for determining if there is a flush,
there is no need to keep track of the suit, since there is [no high card by
suit](https://en.wikipedia.org/wiki/High_card_by_suit) in this exercise.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
