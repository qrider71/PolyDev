package com.mre.polydev.algos

object Utils {
  def measurePerformance[T](f:(Int)=>T, n:Int) : (T, Long) = {
      val start = System.currentTimeMillis()
      val result = f(n)
      val end = System.currentTimeMillis
      val diff = end - start
      return (result, diff)
  }
}