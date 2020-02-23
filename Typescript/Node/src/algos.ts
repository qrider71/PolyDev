
let n= process.argv.length > 2 ? +process.argv[2] : 1000000

let startTS = Date.now()
let primes = findPrimes(n)
let stopTS = Date.now()
let duration = stopTS - startTS
let primesCount = primes.length
console.log(`Typescript: Found ${primes.length} primes until ${n} in ${duration}ms`)

let startRecTS = Date.now()
let primesRec = findPrimesRec(n);
let stopRecTS = Date.now()
let durationRec = stopRecTS - startRecTS
let primesRecCount = primesRec.length
console.log(`Typescript (rec): Found ${primesRec.length} primes until ${n} in ${durationRec}ms`)


function findPrimes(n: number): Array<number> {
    let a = new Array<boolean>(n);
    a.fill(false)
    let primes = [2]
    for (let i = 3; i < n; i += 2) {
        if (!a[i]) {
            primes.push(i);
            for (let j = i * i; j < n; j += 2 * i) {
                a[j] = true;
            }
        }
    }
    return primes;
}

// recursive implementation to test tail recusion optimization
function findPrimesRec(n: number): Array<number> {
    function filterSieve(p: number, a: Array<boolean>): Array<boolean> {
        for (let i = p * p; i < n; i += 2 * p) {
            a[i] = false
        }
        return a
    }

    function sieve(p: number, a: Array<boolean>): Array<number> {
        switch (true) {
            case (p * p > n):
                {
                    let primes = [2]
                    for (let i = 3; i < n; i += 2) {
                        if (a[i]) {
                            primes.push(i)
                        }
                    }
                    return primes
                }
            case (a[p]):
                return sieve((p + 2), filterSieve(p, a))
            default:
                return sieve((p + 2), a)
        }
    }

    let a = new Array<boolean>(n);
    a.fill(true)

    for (let i = 4; i < n; i += 2) {
        a[i] = false
    }
    return sieve(3, a)
}