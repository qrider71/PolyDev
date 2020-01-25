//
//  main.cpp
//  MreAlgos
//
//  Created by Markus Reith on 24.01.20.
//  Copyright © 2020 Markus Reith. All rights reserved.
//

#include <iostream>
#include <vector>

#include <chrono>
#include <cstdint>

uint64_t timeSinceEpochMillisec() {
    using namespace std::chrono;
    return duration_cast<milliseconds>(system_clock::now().time_since_epoch()).count();
}

using namespace std;

vector<int> findPrimes(int until) {
    vector<bool> sieve(until);
    vector<int> primes;
    primes.push_back(2);
    for (int i = 3; i < until; i+=2) {
        if (!sieve[i]) {
            primes.push_back(i);
            for (long j = (long) i * (long) i; j < until; j += 2 * i) {
                sieve[(int) j] = true;
            }
        }
    }
    return primes;
}

vector<int> measurePerformance(function<vector<int>(int)> fn , int until) {
    auto start = timeSinceEpochMillisec();
    auto result = fn(until);
    auto end = timeSinceEpochMillisec();
    cout << "Duration: " << end-start << " ms" << endl;
    return result;
}

int main(int argc, const char * argv[]) {
    int n = 100*1000*1000;
    if (argc == 2) n = atoi(argv[1]);
    
    auto primes = measurePerformance(findPrimes, n);
    std::cout << "Found " << primes.size() << " primes until " << n << endl;
    return 0;
}
