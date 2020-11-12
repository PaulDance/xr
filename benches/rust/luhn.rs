#![feature(test)]
extern crate test;
use test::Bencher;
use luhn::*;

#[bench]
fn test_valid_number_with_an_odd_number_of_spaces(b: &mut Bencher) {
    b.iter(|| is_valid("234 567 891 234"));
}
