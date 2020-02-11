package com.mre.polydev.kotlin

fun <T>measurePerformance(f: (Int)->T, n: Int) : Pair<T, Long> {
    val start = System.currentTimeMillis()
    val result = f(n)
    val end = System.currentTimeMillis()
    val duration = end - start
    return Pair(result, duration)
}