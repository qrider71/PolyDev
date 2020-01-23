package com.mre.polydev.sbserv;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import static com.mre.polydev.algos.Algos.*;

@RestController
@RequestMapping("/primes")
public class PrimesRestController {

    @GetMapping
    public String hello() {
        return "Hello";
    }

    @GetMapping(value = "/{primesUntil}")
    public List<Integer> getPrimes(@PathVariable("primesUntil") Integer primesUntil) {
        return findPrimes(primesUntil);
    }
    

}