// an iterator of all the even fibs
fn even_fibs() -> impl Iterator<Item = usize> {
    let mut tup = (0, 2);
    std::iter::from_fn(move || {
        tup = (tup.1, 4 * tup.1 + tup.0);
        Some(tup.1)
    })
}

fn main() {
    // take the even fibs less than 40_000_000 and sum them, same as python
    println!("{}", even_fibs().take_while(|x| x <= &40_000_000).sum::<usize>())
}
