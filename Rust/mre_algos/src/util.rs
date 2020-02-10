use std::time::Instant;

pub fn measure_performance(f: fn(n: usize) -> Vec<usize>, n:usize) -> (Vec<usize>, u128) {
    let start = Instant::now();
    let primes = f(n);
    let duration = start.elapsed().as_millis();
    return (primes, duration);
}