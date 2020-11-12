#![feature(test)]
extern crate test;
use test::Bencher;
use grains::*;

#[bench]
fn test_returns_the_total_number_of_grains_on_the_board(b: &mut Bencher) {
    b.iter(|| total());
}
