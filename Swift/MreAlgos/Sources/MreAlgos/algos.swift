//
//  algos.swift
//  MreAlgos
//
//  Created by Markus Reith on 24.01.20.
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
