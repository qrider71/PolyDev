package com.mre.polydev.algos

import scala.math.sqrt
import scala.collection.mutable.ListBuffer

object Algos {
  def findPrimes(n:Int) : Seq[Int] = {
    def filterSieve(p:Int, a:Array[Boolean]):Array[Boolean] = {
      for (i <- p*p until n by 2*p) a(i) = false
      a
    }

    def sieve (p:Int, a:Array[Boolean]) : Seq[Int] =
        if (p * p > n) for (i <- 2 until n if a(i)) yield i
        else if (a(p)) sieve ( (p+2), filterSieve (p, a) )
        else sieve ((p+2), a)

    var a = Array.fill(n) {true}
    for (i <- 4 until n by 2) a(i) = false
    return sieve (3, a)
  }

  def findPrimesCstyle(n: Int): ListBuffer[Int] = {
    var sieve = new Array[Boolean](n)
    var primes =  new ListBuffer[Int]
    val sqrtN: Int = sqrt(n.toDouble).toInt

    primes = primes += 2
    for (i <- 3 until n by 2) {
      if (!sieve(i)) {
        primes = primes += i
        if (i < sqrtN) {
          for (j <- i * i until n by 2 * i) {
            sieve.update(j, true)
          }
        }
      }
    }
    primes
  }


}
