package com.mre.polydev.algos;

import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

import org.junit.Test;

import static com.mre.polydev.algos.Algos.*;
import static com.mre.polydev.algos.Utils.*;

public class AlgosTest {

    @Test
    public void testFindPrimes() {
        final int primesUntil =  1000 * 1000;
        final int countPrimesUntil1M =  78498;

        var testFuncs = new ArrayList<Supplier<List<Integer>>>();
        testFuncs.add(() -> findPrimes(primesUntil));
        testFuncs.add(() -> findPrimesBitset(primesUntil));
        testFuncs.add(() -> findPrimesCstyle(primesUntil));
        var countCorrectFunctions = testFuncs
            .stream()
            .map(f -> measurePerformance(f, 10))
            .map(r -> r.size())
            .filter(n->(n==countPrimesUntil1M))
            .count();
    
        assertTrue(countCorrectFunctions == testFuncs.size());
    }
}
