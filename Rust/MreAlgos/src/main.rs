use std::time::Instant;    

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
    let n = 100*1000*1000;
    let start = Instant::now();
    let primes = find_primes(n);
    let elapsed = start.elapsed();
    let duration = elapsed.as_millis();
    let count = primes.len();

    println!("Rust: Found {} primes below {} in {} ms", count, n, duration);
}
