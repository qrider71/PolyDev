use std::env;

mod algos;
mod util;

fn main() {
    let n_default = 100 * 1000 * 1000;

    let args: Vec<String> = env::args().collect();
    let n = match args.as_slice() {
        [_fist, second] => second.parse().unwrap_or(n_default),
        _ => n_default,
    };

    let (primes, duration) = util::measure_performance(algos::find_primes, n);
    let (primes_rec, duration_rec) = util::measure_performance(algos::find_primes_rec, n);
    println!(
        "Rust: Found {} primes below {} in [{} ms]",
        primes.len(),
        n,
        duration
    );
    println!(
        "Rust (recursive): Found {} primes below {} in [{} ms]",
        primes_rec.len(),
        n,
        duration_rec
    );
}
