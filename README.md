[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/qrider71/PolyDev) 

# PolyDev

My personal playground for polyglot programming with different languages and frameworks

# Disclaimer

Here I test different programming concepts. In my professional career as software engineer
I have been working with Java since it came up with version 1.0.2. However, I am fascinated
by the concepts of functional programming. The past developments in Java and othe OO languages have shown that more and more functional concepts find there way into the traditional object oriented world. Whatever I provide here is not intentended for production usage. The code might
change frequently and will be stay alpha version forever. I am also very aware that there might
exist better algorithms than those I have implemented. As said I am mainly playing around here
to try how I could solve a particular problem in different languages.

# Programming languages used in this repository

My favourite languages are

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
came up its main features why it became successful where garbage collection, platform
independent object code (develop locally and run it anywhere) and the ability to run in
web browsers (applets). One of the main critism on Java have always been performance concerns.
Interestingly, those arguments have changed: Platform independence have become almost unimportant with Linux and Docker as prevalent target platforms. Almost all modern languages
provide sophisticated memory management. Finally the Java applet technology is dead, no one
uses Java in a web browser, it has been completely replaced with technologies like
Typscript/Angular. Performance has become less important with powerful backend systems and
highly scalable service oriented architectures.
For me the main argument for using Java now is the vast amount of (freely) available, mature
and stable framework and software components.

## F# (F sharp)

F# is mainly a functional programming language derived from the ML family, in particular OCaml.
OCaml introduced object oriented concepts into classic functional ML. F# is ideal if you want to code mainly functional but not purely functional. Since Microsoft has become open for other
platforms, i.e. Linux and provide their .Net framework free of charge (.Net core) F# is an
interesting alternative.

## Scala

Scala is a hybrid language derived from Java and functional languages. 

## Haskell

Haskell is the classic functional programming language coming from an academic background.
It is a purely functional language used for teaching functional programming concept.

## Swift

Swift is a modern hybrid language inspired by C# and Haskell. It has been developped by Apple
replacing Objective-C as main language for iOS and MacOS X. Swift is freely available for all
major plattforms.

## Python

Python is a classic interpreted language.

## Rust

Rust is a multi-pardadigm programming language developped by Mozilla Research. Rust has a strong focus on memory and concurrency safety. Rust is well known for its very good runtime performance which is comparable to C++.

## C++

C++ is the classic object-oriented language which inspired most of the recent OO languages

# How to use this playground online

The easiest way to play on my playground is to register with gitpot.io
and open my repository with the link below in the browser based IDE Gitpod.

https://gitpod.io/#https://github.com/qrider71/PolyDev

The IDE accesses a remote docker container which is set up for software
development is several programming languages. There are no further installations
required on your local system, the remote system provides all required dependencies.
All you need is a normal web browser.

## How to build the software

From the Gitpod IDE open a terminal. From The PolyDev directory simply execeute
the build script: ./build.sh

## How to run the software

From the Gitpod IDE open a terminal. From The PolyDev directory simply execeute
the build script: ./run.sh

# How to use this playground on your local system

The source code should be independent from your local system. However, the provided
shell scripts will only work on Unix like systems and MacOS X. To build and run the
software you need to set up the development environments for the programming languages
used in this project. The best way is to have a look in the provided Docker file.

# Performance Comparison 

(MacBook Pro, mid 2015, 2,5 GHz Quad-Core Intel Core i7, 16 GB RAM)

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
Haskel (rec)|26|281|3349|132940
F#|20|184|1073|13240
F# (rec)|26|124|1258|16037
Scala (rec)|104|351|2446|Out of Memory
Scala Native (C style)|6|55|631|8787
Scala Native (rec)|6|61|667|11250
Julia|28|66|592|8204
Typescript|20|147|33602|Out of Memory
Typescript (rec)|19|148|39069|Out of Memory

# Links

## Java links

- https://openjdk.java.net/

## F# links

- https://fsharp.org/

## Scala links

- https://www.scala-lang.org/
- https://dotty.epfl.ch/
- http://www.scalanlp.org/

## Haskell links

- https://www.haskell.org/

## Swift links

- https://docs.swift.org/
- https://developer.apple.com/swift/

## Python links

- https://www.python.org/

## Rust links

- https://www.rust-lang.org/

## C++ links

- https://isocpp.org/
