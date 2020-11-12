#![feature(test)]
extern crate test;
use test::Bencher;
use sublist::*;

#[bench]
fn huge_sublist_not_in_huge_list(b: &mut Bencher) {
    let v1: Vec<u64> = (10..1_000_001).collect();
    let v2: Vec<u64> = (1..1_000_000).collect();

    b.iter(|| sublist(&v1, &v2));
}
