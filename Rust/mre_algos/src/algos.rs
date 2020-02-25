pub fn find_primes(n: usize) -> Vec<usize> {
    let mut a = vec![false; n];
    let mut primes = Vec::new();
    primes.push(2);
    for i in (3..n).step_by(2) {
        if !a[i] {
            primes.push(i);
            for i in (i * i..n).step_by(2 * i) {
                a[i] = true;
            }
        }
    }
    primes
}

// recursive implementation to test tail recusion optimization
pub fn find_primes_rec(n: usize) -> Vec<usize> {
    fn sieve(n: usize, p: usize, a: &mut Vec<bool>) -> Vec<usize> {
        if p * p > n {
            a.iter()
                .skip(2)
                .enumerate()
                .filter(|(_i, x)| **x)
                .map(|(i, _x)| i)
                .collect()
        } else if a[p] {
            for i in (p * p..n).step_by(2 * p) {
                a[i] = false;
            }
            sieve(n, p + 2, a)
        } else {
            sieve(n, p + 2, a)
        }
    }
    let mut a = vec![true; n];
    for i in (4..n - 1).step_by(2) {
        a[i] = false;
    }
    sieve(n - 1, 3, &mut a)
}
