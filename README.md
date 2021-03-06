[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/qrider71/PolyDev) 

# PolyDev

My personal playground for polyglot programming with different languages and frameworks

# Disclaimer

Here I test different programming concepts. In my professional career as software engineer
I have been working with Java since it came up with version 1.0.2. However, I am fascinated
by the concepts of functional programming. The past developments in Java and other OO languages
have shown that more and more functional concepts find there way into the traditional object
oriented world. Whatever I provide here is not intentioned for production usage. The code might
change frequently and will be staying alpha version forever. I am also very aware that there might
exist better algorithms than those I have implemented. As said I am mainly playing around here
to try how I could solve a particular problem in different languages.

# Programming languages used in this repository

My favorite languages are

- Java
- F# (F sharp)
- Scala
- Haskell
- Swift
- Python
- Rust
- C++
- Julia
- Typescript

# Some notes about the programming languages

## Java

Java is mainly a classic object-oriented programming language inspired by C++. When Java
came up its main features why it became successful were garbage collection, platform
independent object code (develop locally and run it anywhere) and the ability to run in
web browsers (applets). One of the main criticism on Java have always been performance concerns.
Interestingly, those arguments have changed: Platform independence have become almost unimportant
with Linux and Docker as prevalent target platforms. Almost all modern languages
provide sophisticated memory management. Finally the Java applet technology is dead, no one
uses Java in a web browser, it has been completely replaced with web technologies like
Typescript/Angular. Performance has become less important with powerful backend systems and
highly scalable service oriented architectures.
For me the main argument for using Java now is the vast amount of (freely) available, mature
and stable framework and software components.

## F# (F sharp)

F# is mainly a functional programming language derived from the ML family, in particular OCaml.
OCaml introduced object oriented concepts into classic functional ML. F# is ideal if you want to
code mainly functional but not purely functional. Since Microsoft has become open for other
platforms, i.e. Linux and provide their .Net framework free of charge (.Net core) F# is an
interesting alternative.

## Scala

Scala is a hybrid language derived from Java and functional languages.

## Haskell

Haskell is the classic functional programming language coming from an academic background.
It is a purely functional language used for teaching functional programming concept.

## Swift

Swift is a modern hybrid language inspired by C# and Haskell. It has been developed by Apple
replacing Objective-C as main language for iOS and MacOS X. Swift is freely available for all
major platforms.

## Python

Python is a classic interpreted language.

## Rust

Rust is a multi-paradigm programming language developed by Mozilla Research. Rust has a strong focus on memory and concurrency safety. Rust is well known for its very good runtime performance which is comparable to C++.

## C++

C++ is the classic object-oriented language which inspired most of the recent OO languages

## Julia

Julia comes from the scientific programming background. It is strongly inspired by MatLab. It comes with
build-in algorithms for basic number crunching problems, in particular linear algebra.
It's main focus is on performance. It uses the LLVM compiler for generating native code, Julia can
also easily interface with C code for further performance optimizations.

## Typescript

Typescript started as a replacement for JavaScript in web browsers providing the missing type system in JavaScript.
Typescript compiles to JavaScript so still is an interpreted language. With NodeJS a server side implementation for
executing TypeScript has become available.

# How to use this playground online

The easiest way to play on my playground is to register with gitpot.io
and open my repository with the link below in the browser based IDE GitPod.

<https://gitpod.io/#https://github.com/qrider71/PolyDev>

The IDE accesses a remote docker container which is set up for software
development is several programming languages. There are no further installations
required on your local system, the remote system provides all required dependencies.
All you need is a normal web browser.

## How to build the software

From the GitPod IDE open a terminal. From The PolyDev directory simply execute
the build script: ./build.sh

## How to run the software

From the GitPod IDE open a terminal. From The PolyDev directory simply execute
the build script: ./run.sh

# How to use this playground on your local system

The source code should be independent from your local system. However, the provided
shell scripts will only work on Unix like systems and MacOS X. To build and run the
software you need to set up the development environments for the programming languages
used in this project. The best way is to have a look in the provided Docker file.

# Performance Comparison

(MacBook Pro, mid 2015, 2,5 GHz Quad-Core Intel Core i7, 16 GB RAM)

## The algorithm

This performance comparison is based on the algorithm "Sieve of Eratosthenes" for
computing prime numbers (see <https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes> ).
For several programming languages two algorithms are provided: a classic algorithm using loops
and aa recursive implementation to test tail recursion optimization.

Basically, the algorithms filters a boolean array and crosses out non-prime numbers.
It starts with an array which is initialized with all indices set to true (or false depending
on the definition). It iteratively crosses out all multiples of prime numbers so that only primes are
left over. Each iteration leeds to the next prime number for which its multiple will be crossed out.
It starts with 2 as first prime number and crosses out 4,6,8,10,12,14,16,18,20 ... n as multiples
of 2. The next prime number for the next iteration is the next number which comes after the current
prime number (2) and which is not crossed out: This is 3. It now crosses out 6,9,12,15,18,21 ... n.
It can be shown that the actual crossing out process for a prime number p can start with p*p since
all multiples of p before p*p has been crossed out in iterations before. So for the prime number
3 the algorithms crosses out 9,12,15,18,21 ... n. Number 6 was already crossed out in the previous iteration.
Next number after 3 is 4 but 4 has been crossed out. So for the next iteration the algorithm takes 5
as prime number and crosses out 25,30,35,40, ..., n. Also here we see that the multiples 10 and 15 have
been crossed out in the iteration for 2 and 3. The algorithms for crossing out end when p*p>n, i.e.
the first number to be crossed out would exceed the array length. After having crossed out all multiples
of primes only the primes are left and we can create a list of prime numbers by adding all array indices
to the list where the value is true (i.e. not crossed out)

The table below lists the execution time in milliseconds for each programming language and implementation style.
The execution time is listed for different array sizes n, i.e. maximum number for which all prime numbers
below shall be computed.

Iterations (10^n)|6|7|8|9
-----|-----|-----|-----|-----
Java|43|126|1123|14523
Kotlin|126|679|6675|Out of Memory
Kotlin (rec)|116|739|6031|Out of Memory
Swift|7|75|871|12420
C++|3|26|317|4381
Rust|3|41|549|9240
Rust (rec)|3|43|582|9914
Python|123|1366|14958|168021
Haskell (rec)|26|281|3349|132940
F#|20|184|1073|13240
F# (rec)|26|124|1258|16037
Scala (rec)|104|351|2446|Out of Memory
Scala Native (C style)|6|55|631|8787
Scala Native (rec)|6|61|667|11250
Julia|28|66|592|8204
Typescript|20|147|33602|Out of Memory
Typescript (rec)|19|148|39069|Out of Memory

# Results

## Recursive vs. non-recursive implementations

A recursive implementation only makes sense for programming languages which provide so called
tail recursion optimization. Without this feature, for each recursion call a context frame will be
put on the stack causing the stack to grow enormously. The program would quickly fail with
an out of memory error.

# Links

## Java links

- <https://openjdk.java.net/>

## F# links

- <https://fsharp.org/>

## Scala links

- <https://www.scala-lang.org/>
- <https://dotty.epfl.ch/>
- <http://www.scalanlp.org/>

## Haskell links

- <https://www.haskell.org/>

## Swift links

- <https://docs.swift.org/>
- <https://developer.apple.com/swift/>

## Python links

- <https://www.python.org/>

## Rust links

- <https://www.rust-lang.org/>

## C++ links

- <https://isocpp.org/>

## Julia links

- <https://julialang.org/>

## TypeScript links

- <https://www.typescriptlang.org/>
