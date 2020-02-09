    
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
    println!("{:?}", find_primes(n).len());
}
