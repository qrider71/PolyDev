import org.junit.Test
import org.junit.Assert._
import com.mre.polydev.algos.findPrimes

class Test1 {
  @Test def t1(): Unit = {
    val countPrimes1000:Int=168
    assertTrue(findPrimes(1000).length==countPrimes1000)
  }
}