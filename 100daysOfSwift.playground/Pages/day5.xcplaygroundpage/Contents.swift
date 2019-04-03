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

// 参数label:第一个位置to供外部调用使用，第二个name则是供方法内部使用
func sayHello(to name: String) {
    print("Hello, \(name)")
}

sayHello(to: "Swift")

// 省略参数label
func greeting(_ name: String) {
    print("Hello, \(name)!")
}

greeting("Nick")

// 参数含有默认值，在调用的时候可以不传此参数(给nicely一个默认值true，在调用时可以不传，传递时用传递值)
func greetings(_ person: String, nicely: Bool = true) {
    if nicely {
        print("Greetings \(person)")
    } else {
        print("Greetings again \(person)")
    }
}

greetings("Nicky")
greetings("Nicky", nicely: false)

// 接收多参数的方法
func squares(numbers: Int...) {
    for number in numbers {
        print("square \(number) = \(number * number)")
    }
}

squares(numbers:1, 2, 3, 4, 5, 6, 7, 8)

//: [Next](@next)
