[This chapter](https://doc.rust-lang.org/1.7.0/book/benchmark-tests.html) of
the Rust book describes how to benchmark. Here are the steps I took for setting
it up:

In a new file `benches/whatever.rs` paste the contents of a unit test you think
its performance is worth measuring. Then at the top of the file:

```rust
#![feature(test)]
extern crate test;
use test::Bencher;
```

 * For the test you want to benchmark, replace #[test] with #[bench]. 
 * If the test is marked #[ignore], delete #[ignore]
 * Pass in the variable `b: &mut Bencher`.
 * Modify the line calling `assert!` to call the function in a closure inside a
   call to b.iter().
 * I use rust-analyzer in Vim, VSCode or CLion, which gives me a few links to
   run the benchmark or to run the code in Debug.
 * Example below is from Sublist:

   ```rust
   #[bench]
   fn huge_sublist_not_in_huge_list(b: &mut Bencher) {
       let v1: Vec<u64> = (10..1_000_001).collect();
       let v2: Vec<u64> = (1..1_000_000).collect();
   
       b.iter(|| sublist(&v1, &v2));
   }
   ```

Finally compile and run the benchmarks using `cargo +nightly bench`.

[This article](http://seenaburns.com/benchmarking-rust-with-cargo-bench/)
describes what happens in a bench test.
