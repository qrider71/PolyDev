package com.mre.polydev.kotlin

import kotlin.math.sqrt

fun findPrimesNonRec (n: Int) : List<Int> {
    val maxIndex = n-1
    val maxIndexSqrt:Int = (sqrt(n*1.0)).toInt()
    var a = BooleanArray(n) { true }
    for (i in 4 until n step 2) a[i] = false
    for (i in 3 until maxIndexSqrt step 2) { 
        if (a[i]) {
            for (j in i*i until n step 2*i) {
                a[j] = false
            }
        }
    }
    return a.withIndex().drop(2).filter { x -> x.value }.map { x -> x.index }
}

fun findPrimes(n: Int): List<Int> {

    fun filterSieve(p: Int, a: BooleanArray): BooleanArray {
        for (i in p * p until n step 2 * p) a[i] = false
        return a
    }

    tailrec fun sieve(p: Int, a: BooleanArray): List<Int> {
        return when {
            p * p > n   -> a.withIndex().drop(2).filter { x -> x.value }.map { x -> x.index }
            a[p]        -> sieve((p + 2), filterSieve(p, a))
            else        -> sieve((p + 2), a)
        }
    }

    var a = BooleanArray(n) { true }
    for (i in 4 until n step 2) a[i] = false
    return sieve(3, a)
}

fun main(args: Array<String>) {
    val n = when {
        args.size != 1 -> 100 * 1000 * 1000
        else -> args.first().toInt()
    }

    val (resultNR, durationNR) = measurePerformance(::findPrimesNonRec, n)
    val countNR = resultNR.size
    println("Kotlin: Found $countNR primes below $n in [$durationNR ms]")

    val (result, duration) = measurePerformance(::findPrimes, n)
    val count = result.size
    println("Kotlin (recursive): Found $count primes below $n in [$duration ms]")
}

