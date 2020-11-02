#![feature(test)]
extern crate test;
use test::Bencher;
use nth_prime::*;

#[bench]
fn test_big_prime(b: &mut Bencher) {
    b.iter(|| nth(10_000));
}
