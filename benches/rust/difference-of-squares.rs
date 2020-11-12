#![feature(test)]
extern crate test;
use test::Bencher;

use difference_of_squares::*;
use std::ops::RangeInclusive;

const MIN: u32 = 1_000;
const MAX: u32 = 10_000;
const RANGE: RangeInclusive<u32> = MIN..=MAX;

#[bench]
fn test_square_of_sum_range(b: &mut Bencher) {
    b.iter(|| {
        for i in RANGE {
            square_of_sum(i);
        }
    })
}

#[bench]
fn test_sum_of_squares_range(b: &mut Bencher) {
    b.iter(|| {
        for i in RANGE {
            sum_of_squares(i);
        }
    })
}

#[bench]
fn test_difference_range(b: &mut Bencher) {
    b.iter(|| {
        for i in RANGE {
            difference(i);
        }
    })
}
