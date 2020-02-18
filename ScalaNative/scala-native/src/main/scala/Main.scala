import com.mre.polydev.algos.Algos.findPrimes
import com.mre.polydev.algos.Algos.findPrimesCstyle
import com.mre.polydev.algos.Utils.measurePerformance

object Main {
  def main(args: Array[String]): Unit = {
    val nDefault = 100*1000*1000
    val n = args match {
      case Array() => nDefault
      case Array(x,_*) => x.toInt
    }

    val (primes, time) = measurePerformance(findPrimes, n)
    val count = primes.length
    println (s"Scala Native(recursive): Found $count primes below $n in $time ms" )

    val (primes2, time2) = measurePerformance(findPrimesCstyle, n)
    val count2 = primes2.length
    println (s"Scala Native(non-recursive, C style): Found $count2 primes below $n in $time2 ms" )
  }

  def msg = "I was compiled by dotty :)"
}
