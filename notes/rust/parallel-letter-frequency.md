Congratulations on passing all the tests!

 * I like this solution uses the std library.
 * I like the code is succinct and readable.
 * I like that it is well-commented.

There is a limitation around threads: they were previously scoped, i.e. could
infer data was only used inside a certain context, but they now enforce a
`static` lifetime requirement for borrowed values. If you would like to try
getting better performance, I suggest you take a look at some parallelization
crates such as:

It's also good to get familiar with other crates like
[threadpool](https://crates.io/crates/threadpool),
[crossbeam-utils](https://crates.io/crates/crossbeam-utils),
[rayon](https://crates.io/crates/rayon), or
[tokio](https://crates.io/crates/tokio) for various parallelism scenarios.

The benchmark for large parallel was quite respectable. With the most recent
Rust version, the fastest I usually see is a sequential in the 700 microseconds
with parallel in the 300 microseconds. In all other benchmarks the sequential
is usually faster than the parallel. Older versions of Rust usually were in the
900 microseconds for sequential.

@njutte's solution using the std library only with a custom thread pool:

```rust
test bench_large_parallel   ... bench:     207,273 ns/iter (+/- 40,436)
test bench_large_sequential ... bench:     791,554 ns/iter (+/- 115,804)
test bench_small_parallel   ... bench:      10,939 ns/iter (+/- 1,696)
test bench_small_sequential ... bench:      27,337 ns/iter (+/- 4,242)
test bench_tiny_parallel    ... bench:          76 ns/iter (+/- 14)
test bench_tiny_sequential  ... bench:          70 ns/iter (+/- 13)
```

@BryanMorgan's solution using `crossbeam::scope`:

```rust
test bench_large_parallel   ... bench:     180,057 ns/iter (+/- 6,171)
test bench_large_sequential ... bench:     791,921 ns/iter (+/- 38,868)
test bench_small_parallel   ... bench:      13,054 ns/iter (+/- 906)
test bench_small_sequential ... bench:      26,704 ns/iter (+/- 1,906)
test bench_tiny_parallel    ... bench:          50 ns/iter (+/- 0)
test bench_tiny_sequential  ... bench:          70 ns/iter (+/- 1)
```

@Adenylatcyclase's solution using `crossbeam::scope` and fixed-size static
arrays for individual frequency measurement instead of hashmaps:

```rust
test bench_large_parallel   ... bench:      62,066 ns/iter (+/- 2,085)
test bench_large_sequential ... bench:     790,304 ns/iter (+/- 20,146)
test bench_small_parallel   ... bench:       3,799 ns/iter (+/- 117)
test bench_small_sequential ... bench:      26,791 ns/iter (+/- 390)
test bench_tiny_parallel    ... bench:         303 ns/iter (+/- 7)
test bench_tiny_sequential  ... bench:          74 ns/iter (+/- 1)
```

Your solution:

```rust

```

The use of channels is actually not necessary here: a thread may return a
value, therefore you can simply map loads to workers and reduce their results
into one hashmap. This is known as the
[map-reduce](https://en.wikipedia.org/wiki/MapReduce) method.

I think the preparation of data concatenating all the string slices into one
big owned string is very expensive. You should just split the work among
workers by lines directly which is instantaneous because `input` is itself a
slice. Of course, it takes advantage of the fact that lines are balanced in
number of characters in the considered tests, but you should still take
advantage of it.

You probably noticed that it becomes worse than a sequential algorithm when
considering small work loads. That is kind of expected in any parallelism
attempt: setting up OS threads surprisingly takes a considerable amount of
time, which is one of the reasons behind [asynchronous
programming](https://rust-lang.github.io/async-book/). If you really want the
best possible performance in every situation, then you can try to find a
threshold under which you switch to a sequential implementation.

If you like video tutorials, you may find [a video by Ryan
Levick](https://www.youtube.com/watch?v=2mwwYbBRJSo) to be informative. In the
video he creates a pool of threads to which he passes a closure via an
[mpsc](https://doc.rust-lang.org/std/sync/mpsc/)
[channel](https://doc.rust-lang.org/std/sync/mpsc/fn.channel.html) to do the
work.

This exercise can also be solved with the std library and no `Arc`, `Mutex` or `mpsc`.

You might want to look at using
[hashmap.entry(ch).or_default](https://doc.rust-lang.org/std/collections/hash_map/enum.Entry.html#method.or_default)()
+= 1; vs. matching on the value from the key and so forth.

`'static` lifetime means that the value should live as long as the program. I
recommend [this
article](https://fasterthanli.me/articles/i-am-a-java-csharp-c-or-cplusplus-dev-time-to-do-some-rust)
for a detailed explaination of lifetimes.

Since this solution passed all the tests I'm approving it. If you care to you
may submit another solution refactored to be more performant for parallel. You
may get some helpful ideas by viewing the community solutions.
