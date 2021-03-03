#![feature(test)]
extern crate test;
use test::Bencher;
use forth::*;

#[bench]
fn simple_bench(b: &mut Bencher) {
    let mut f = Forth::new();
    b.iter(|| {
        f.eval(
            "2 2 + : addtwo 2 + ; 2 addtwo drop drop 2 2 + \
            : addone 1 + ; 2 addone addtwo drop drop",
        )
        .unwrap();
    });
}
