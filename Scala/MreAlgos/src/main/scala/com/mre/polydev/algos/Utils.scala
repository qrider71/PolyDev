package com.mre.polydev.algos

def measurePerformance(f:(Int)=>Seq[Int], n:Int) : (Seq[Int], Long) = {
    val start = System.currentTimeMillis()
    val result = f(n)
    val end = System.currentTimeMillis
    val diff = end - start
    return (result, diff)
  }