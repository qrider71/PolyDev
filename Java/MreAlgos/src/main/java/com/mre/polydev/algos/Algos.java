package com.mre.polydev.algos;

import static com.mre.polydev.algos.Utils.getIntFromArgs;
import static com.mre.polydev.algos.Utils.measurePerformance;

import java.util.BitSet;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * This class provides various algorithms
 * 
 * @author Markus Reith
 */
public class Algos {
    public static void main(final String[] args) {
        final int primesUntilDefault =  1000 * 1000;
        
        int primesUntil = getIntFromArgs(args).orElse(primesUntilDefault);
        final int count = measurePerformance(()->findPrimes(primesUntil), 1).size();
        System.out.println("Found " + count + " primes below " + primesUntil);
    }

    /**
     * Implementation of the Sieve of Eratosthenes using Streams
     * 
     * @param n
     * @return List with primes below n
     */
    public static List<Integer> findPrimes(final int n) {
        final var sieve = new boolean[n];
        for (int i = 4; i < n; i += 2) {
            sieve[i] = true;
        }
        return Stream
            .iterate(2, t -> t < n, t -> t + 1)
            .filter(i -> !sieve[i])
            .peek(i -> {
                for (long j = (long) i * (long) i; j < n; j += 2 * i) {
                    sieve[(int) j] = true;
                }
            })
            .collect(Collectors.toList());
    }

    /**
     * Implementation of the Sieve of Eratosthenes using Streams and BitSet
     * for storing the sieve
     * 
     * @param n
     * @return List with primes below n
     */
    public static List<Integer> findPrimesBitset(final int n) {
        final var sieve = new BitSet(n);
        for (int i = 4; i < n; i += 2) {
            sieve.set(i);
        }
        return Stream
            .iterate(2, t -> t < n, t -> sieve
            .nextClearBit(t + 1))
            .peek(i -> {
                for (long j = (long) i * (long) i; j < n; j += 2 * i) {
                    sieve.set((int) j);
                }
            })
            .collect(Collectors.toList());
    }

    /**
     * Old school C-style implementation of the Sieve of Eratosthenes
     * @param n
     * 
     * @return List with primes below n
     */
    public static List<Integer> findPrimesCstyle(final int n) {
        final var sieve = new boolean[n + 1];
        for (int i = 4; i <= n; i += 2) {
            sieve[i] = true;
        }
        final var primes = new LinkedList<Integer>();
        for (int i = 2; i < n; i++) {
            if (!sieve[i]) {
                primes.add(i);
                for (long j = (long) i * (long) i; j < n; j += 2 * i) {
                    sieve[(int) j] = true;
                }
            }
        }
        return primes;
    }
}