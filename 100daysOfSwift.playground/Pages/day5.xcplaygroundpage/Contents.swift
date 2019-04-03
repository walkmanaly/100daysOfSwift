//: [Previous](@previous)

import Foundation

var str = "function"

// 方法
func runMyApp() {
    let message = """
Hello! This is my day5 learned swift!
"""
    print(message)
}

runMyApp()

// 带参数的方法
func squre(number: Int) {
    let result = number * number
    print("result = \(result)")
}

squre(number: 6)

// 带参数和返回值的方法
func square(number: Int) -> Int {
    return number * number
}
let result = square(number: 9)
print("square result = \(result)")

//: [Next](@next)
