//
//  utils.swift
//  MreAlgos
//
//  Created by Markus Reith on 24.01.20.
//

import Foundation

func measurePerformance (fn: (Int)->[Int], n:Int) -> ([Int], TimeInterval) {
    let start = Date()
    let result = fn(n)
    let end = Date()
    let duration = end.timeIntervalSince(start)
    return (result, duration)
}

func getPrimesUntilFromCommandLine() -> Int {
    let defaultUntil = 100*1000*1000
    let argCount = CommandLine.argc
    if (argCount == 2) {
        let argument = CommandLine.arguments[1]
        return Int(argument) ?? defaultUntil
    } else {
        return defaultUntil
    }
}
