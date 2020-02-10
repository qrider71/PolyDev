package com.mre.polydev.algos

def findPrimes(n:Int) : Seq[Int] = {
  val maxIndex = n-1
  def filterSieve(p:Int, a:Array[Boolean]):Array[Boolean] = {
    for (i <- p*p until maxIndex by 2*p) a(i) = false
    a
  } 

  def sieve (p:Int, a:Array[Boolean]) : Seq[Int] = 
    (p,a) match {
      case (p,a) if p * p > maxIndex => for (i <- 2 until maxIndex if a(i)) yield i
      case (p,a) if a(p)  => sieve ( (p+2), filterSieve (p, a) ) 
      case _ => sieve ((p+2), a)
    }

  var a = Array.fill(n) {true}
  for (i <- 4 until maxIndex by 2) a(i) = false
  return sieve (3, a)
}