fn even_fibs() -> impl Iterator<Item = usize> {
    let mut tup = (2, 2);
    std::iter::from_fn(move || {
        tup = (tup.1, 4 * tup.0 + tup.1);
        Some(tup.1)
    })
}

fn main() {
    println!("{}", even_fibs().take_while(|x| x <= &40_000_000).sum::<usize>())
}
