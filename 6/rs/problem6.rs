fn main() {
    println!("{}", (1..100).sum::<usize>().pow(2) - (1..100).map(|x| x * x).sum::<usize>());
}
