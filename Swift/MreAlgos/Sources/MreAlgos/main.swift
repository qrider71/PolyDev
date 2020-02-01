//  MreAlgos
//
//  Created by Markus Reith on 24.01.20.
//

import Foundation

let until = getPrimesUntilFromCommandLine()
let (res, time) = measurePerformance(fn: findPrimes, n: until)
print("Swift: Found \(res.count) primes until \(until) in \(time) ms")