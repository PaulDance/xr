Concerning your question, well, it's not that simple. If you try to have types
only big enough to represent the values you expect, which I would generally
recommend, then you save size. That last part is especially good if you will
store a lot of these values in contiguous region of memory. Otherwise, casts do
cost some CPU cycles, so there is definitely a compromise to find here.
However, I would tend to say that it does not matter too much in these
exercises.
