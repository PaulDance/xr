#![feature(test)]
extern crate test;
use test::Bencher;
use minesweeper::*;

#[bench]
fn large_board(b: &mut Bencher) {
    b.iter(|| {
        #[rustfmt::skip]
        annotate(&[
            " *  * ",
            "  *   ",
            "    * ",
            "   * *",
            " *  * ",
            "      ",
        ]);
    })
}
