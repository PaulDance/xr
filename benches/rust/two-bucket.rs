#![feature(test)]
extern crate test;
use test::Bencher;
use two_bucket::*;

#[bench]
fn test_case_4(b: &mut Bencher) {
    b.iter(|| solve(7, 11, 2, &Bucket::Two))
}
