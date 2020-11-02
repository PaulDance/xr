#![feature(test)]
extern crate test;
use test::Bencher;
use prime_factors::*;

#[bench]
fn test_factors_include_large_prime(b: &mut Bencher) {
    b.iter(|| factors(93_819_012_551));
}
