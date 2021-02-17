Congratulations on passing all the tests!

 * I like this solution uses `div_euclid`.

You could simplify the retrieval of the input number's digits by converting it
to a string.

Converting a character to its corresponding digit can be done using
`char::to_digit`.

The logarithm could be avoided by simply storing the result of
`num.to_string()` in a name binding and using its length after.

I don't benchmark this exercise, but this solution seems to be performant.

Viewing the community solutions may offer other approaches to this exercise
which you may find interesting.
