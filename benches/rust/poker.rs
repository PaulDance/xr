#![feature(test)]
extern crate test;
use test::Bencher;
use poker::winning_hands;

#[bench]
fn simple_bench_poker(b: &mut Bencher) {
    let hands = [
        "10D JH QS KD AC",
        "2H 3C 4D 5D 6H",
        "2S 2H 2C 8D 2D",
        "2S 2H 2C 8D JH",
        "2S 4C 7S 9H 10H",
        "2S 4H 6C 4D JD",
        "2S 4H 6S 4D JH",
        "2S 4S 5S 6S 7S",
        "2S 5D 6D 8C 7S",
        "2S 8H 2D 8D 3H",
        "2S 8H 2H 8D JH",
        "2S 8H 6S 8D JH",
        "2S QS 2C QD JH",
        "3H 4H 5C 6C JD",
        "3H 6H 7H 8H 5H",
        "3S 3H 2S 3D 3C",
        "3S 3H 4S 3D 3C",
        "3S 4D 2S 6D 5C",
        "3S 4S 5D 6H JH",
        "3S 5H 6S 8D 7H",
        "4C 6H 7D 8D 5H",
        "4D 5S 6S 8D 3C",
        "4D AH 3S 2D 5C",
        "4H 4S 4D 9S 9D",
        "4H 6H 7H 8H 5H",
        "4H 7H 8H 9H 6H",
        "4S 2H 6S 2D JH",
        "4S 5C 4C 5D 4H",
        "4S 5H 4C 8C 5C",
        "4S 5H 4C 8D 4H",
        "4S 5H 4C 8S 5D",
        "4S 5H 4D 5D 4H",
        "4S 5H 5S 5D 5C",
        "4S 5H 6C 8D KH",
        "4S 5S 7H 8D JC",
        "4S 6C 7S 8D 5H",
        "4S AH 3S 2D 5H",
        "4S AH AS 7C AD",
        "4S AH AS 8C AD",
        "5H 5S 5D 8S 8D",
        "5H 5S 5D 9S 9D",
        "5S 7H 8S 9D 6H",
        "5S 7S 8S 9S 6S",
        "7S 8S 9S 6S 10S",
        "JD QH JS 8D QC",
        "JS QS JC 2D QD",
    ];

    b.iter(|| {
        winning_hands(&hands).unwrap();
    });
}
