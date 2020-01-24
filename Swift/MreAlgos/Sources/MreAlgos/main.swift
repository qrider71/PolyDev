// @author Markus Reith
//

import Foundation

func findPrimes(until:Int) -> [Int] {
    var sieve = Array(repeating: false, count: until)
    var primes = [2]
    stride(from: 3, to: until, by: 2).forEach {
        if !sieve[$0] {
            primes.append($0)
            stride(from: $0 * $0, to: until, by: $0 * 2).forEach { sieve[$0] = true }
        }
    }
    return primes
}

func measurePerformance (fn: (Int)->[Int], n:Int) -> ([Int], TimeInterval) {
    let start = Date()
    let result = fn(n)
    let end = Date()
    let duration = end.timeIntervalSince(start)
    return (result, duration)
}

let until = 100 * 1000 * 1000
let (res, time) = measurePerformance(fn: findPrimes, n: until)
let count = res.count

print("Found \(count) primes until \(until) in \(time) seconds")
