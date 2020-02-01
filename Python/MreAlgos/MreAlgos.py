import time
import sys

def findPrimes(until):
    sieve = [False] * until
    primes = [2]
    for i in range(3, until, 2):
        if (sieve[i] == False):
            primes.append(i)
            for j in range(i*i, until, i * 2):
                sieve[j] = True
    return primes

def getMillis():
    return int(round(time.time() * 1000))

def measurePerformance(fn, n):
    start = getMillis()
    result = fn(n)
    end = getMillis()
    return (result, end-start)


n =  100 * 1000 * 1000
nArgs = len(sys.argv) - 1
if (nArgs == 1):
    n = int(sys.argv[1])

(primes, duration) = measurePerformance(findPrimes, n)
nPrimes = len(primes)
print (f'Python: Found {nPrimes} primes until {n} in {duration} ms')
