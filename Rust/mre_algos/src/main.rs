use std::time::Instant;
use std::env;    

fn find_primes(n:usize) -> Vec<usize> {
    let mut a = vec![false; n];
    let mut primes = Vec::new();
    primes.push(2);
    for i in (3..n).step_by(2) {
        if !a[i] {
            primes.push(i);
            for i in (i*i..n).step_by(2*i) {
                a[i] = true;
            }
        }
    }
    return primes;
}

fn main() {
    let n_default = 100*1000*1000;

    let args: Vec<String> = env::args().collect();
    let n = match args.as_slice() {
        [_fist, second] => second.parse().unwrap_or(n_default),
        _ => n_default
    };

    let start = Instant::now();
    let primes = find_primes(n);
    let duration = start.elapsed().as_millis();
    let count = primes.len();

    println!("Rust: Found {} primes below {} in {} ms", count, n, duration);
}
