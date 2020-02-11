package com.mre.polydev.kotlin.tests

import com.mre.polydev.kotlin.findPrimes
import kotlin.test.assertEquals
import org.junit.Test

class HelloTest {
    @Test fun testAssert() : Unit {
        assertEquals(25, findPrimes(100).size)
    }
}
