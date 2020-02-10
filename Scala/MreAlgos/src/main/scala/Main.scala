import com.mre.polydev.algos.findPrimes
import com.mre.polydev.algos.measurePerformance

object Main {
  def main(args: Array[String]): Unit = {
    val nDefault = 100*1000*1000
    val n = args match {
      case Array() => nDefault
      case Array(x,_*) => x.toInt
    }

    val (primes, time) = measurePerformance(findPrimes, n)
    val count = primes.length
    println (s"Scala (recursive): Found $count primes below $n in $time ms" )
  }

  def msg = "I was compiled by dotty :)"
}
