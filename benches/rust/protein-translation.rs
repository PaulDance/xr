#![feature(test)]
extern crate test;
use test::Bencher;
use protein_translation::*;

#[bench]
fn bench_pairs(b: &mut Bencher) {
    let pairs = make_pairs();
    b.iter(|| parse(pairs.clone()))
}

// The input data constructor. Returns a list of codon, name pairs.
fn make_pairs() -> Vec<(&'static str, &'static str)> {
    let mut pairs = vec![
        ("isoleucine", vec!["AUU", "AUC", "AUA"]),
        ("valine", vec!["GUU", "GUC", "GUA", "GUG"]),
        ("phenylalanine", vec!["UUU", "UUC"]),
        ("methionine", vec!["AUG"]),
        ("cysteine", vec!["UGU", "UGC"]),
        ("alanine", vec!["GCU", "GCC", "GCA", "GCG"]),
        ("glycine", vec!["GGU", "GGC", "GGA", "GGG"]),
        ("proline", vec!["CCU", "CCC", "CCA", "CCG"]),
        ("threonine", vec!["ACU", "ACC", "ACA", "ACG"]),
        ("serine", vec!["AGU", "AGC"]),
        ("tyrosine", vec!["UAU", "UAC"]),
        ("tryptophan", vec!["UGG"]),
        ("glutamine", vec!["CAA", "CAG"]),
        ("asparagine", vec!["AAU", "AAC"]),
        ("histidine", vec!["CAU", "CAC"]),
        ("glutamic acid", vec!["GAA", "GAG"]),
        ("aspartic acid", vec!["GAU", "GAC"]),
        ("lysine", vec!["AAA", "AAG"]),
        ("arginine", vec!["CGU", "CGC", "CGA", "CGG", "AGA", "AGG"]),
        ("stop codon", vec!["UAA", "UAG", "UGA"]),
    ]
    .into_iter()
    .flat_map(|(name, codons)| codons.into_iter().map(move |codon| (codon, name)))
    .collect::<Vec<_>>();

    pairs.sort_by(|&(_, a), &(_, b)| a.cmp(b));
    pairs
}
