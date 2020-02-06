import com.mre.polydev.algos.findPrimes

object Main {

  def main(args: Array[String]): Unit = {
    val nDefault = 100 * 1000 * 1000

    val n = args match {
      case Array() => nDefault
      case Array(x,_*) => x.toInt
    }

    val start = System.currentTimeMillis()
    val primes = findPrimes(n)
    val end = System.currentTimeMillis
    val count = primes.length
    val diff = end - start
    println (s"Scala: Found $count primes below $n in $diff ms" )
  }

  def msg = "I was compiled by dotty :)"

}
