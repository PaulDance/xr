#![feature(test)]
extern crate test;
use test::Bencher;
use saddle_points::*;

#[bench]
fn identify_all_saddle_points(b: &mut Bencher) {
    let input = vec![vec![5, 5, 5], vec![5, 5, 5], vec![5, 5, 5]];
    b.iter(|| find_saddle_points(&input));
}
