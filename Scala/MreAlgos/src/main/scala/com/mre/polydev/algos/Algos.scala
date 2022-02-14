package com.mre.polydev.algos

import scala.annotation.tailrec

def findPrimes(n:Int) : Seq[Int] = {
  def filterSieve(p:Int, a:Array[Boolean]):Array[Boolean] = {
    for (i <- p*p until n by 2*p) a(i) = false
    a
  }

  @tailrec
  def sieve (p:Int, a:Array[Boolean]) : Seq[Int] =
    if (p * p > n) for (i <- 2 until n if a(i)) yield i
    else if (a(p)) sieve ( (p+2), filterSieve (p, a) )
    else sieve ((p+2), a)


  var a = Array.fill(n) {true}
  for (i <- 4 until n by 2) a(i) = false
  return sieve (3, a)
}
