#![feature(test)]
extern crate test;
use test::Bencher;
use pythagorean_triplet::*;

#[bench]
fn test_triplets_for_large_number(b: &mut Bencher) {
    b.iter(|| find(30_000))
}
