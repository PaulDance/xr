#![feature(test)]
extern crate test;
use test::Bencher;
use anagram::*;

#[bench]
fn test_multiple_anagrams(b: &mut Bencher) {
    let word = "allergy";
    let inputs = [
        "gallery",
        "ballerina",
        "regally",
        "clergy",
        "largely",
        "leading",
    ];

    b.iter(|| anagrams_for(word, &inputs));
}
