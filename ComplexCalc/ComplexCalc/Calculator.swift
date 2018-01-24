//
//  Calculator.swift
//  ComplexCalc
//
//  Created by Ted Neward on 10/4/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

// All your work will go in here
class Calculator {
    public func add(_ args: [Int]) -> Int {
        return args.reduce(0, +)
    }
    public func add(lhs: Int, rhs: Int) -> Int {
        return lhs + rhs
    }
    public func add(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        var result = [String : Int]()
        for (key, value) in lhs {
            let lk:String = key
            let lv:Int = value
            result[lk] = lv + rhs[lk]!
        }
        return result
    }
    public func add(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 + rhs.0, lhs.1 + rhs.1)
    }
    public func subtract(lhs: Int, rhs: Int) -> Int {
        return lhs - rhs
    }
    public func subtract(lhs: (Int, Int), rhs: (Int, Int)) -> (Int, Int) {
        return (lhs.0 - rhs.0, lhs.1 - rhs.1)
    }
    public func subtract(lhs: [String : Int], rhs: [String : Int]) -> [String : Int] {
        var result = [String : Int]()
        for (key, value) in lhs {
            let lk:String = key
            let lv:Int = value
            result[lk] = lv - rhs[lk]!
        }
        return result
    }
    public func multiply(_ args: [Int]) -> Int {
        return args.reduce(1, *)
    }
    public func multiply(lhs: Int, rhs: Int) -> Int {
        return lhs * rhs
    }
    public func divide(lhs: Int, rhs: Int) -> Int {
        return lhs / rhs
    }
    public func count(_ args: [Int]) -> Int {
        return args.count
    }
    public func avg(_ args: [Int]) -> Int {
        return args.reduce(0, +) / args.count
    }
    public func mathOp(lhs: Int, rhs: Int, op: (_ num1: Int, _ num2: Int) -> Int) -> Int {
        return op(lhs, rhs)
    }
    public func mathOp(args: [Int], beg: Int, op: (_ num1: Int, _ num2: Int) -> Int) -> Int {
        return mathOpHelper(args: args, beg: beg, index: 0, op: op)
    }
    public func mathOpHelper(args: [Int], beg: Int, index: Int, op: (_ num1: Int, _ num2: Int) -> Int) -> Int {
        if index >= args.count {
            return beg
        }
        return mathOpHelper(args: args, beg: op(beg, args[index]), index: index + 1, op: op)
    }
}
