//: [Previous](@previous)

import Foundation

// 闭包closure
// 1、swift允许方法像其他类型(Sring、Int)一样，赋值给一个变量，然后使用这个变量来调用方法
let learning = {
    print("I'm learning swift!")
}

learning()

// 2、带参数的闭包
let learningWhat = { (what: String) in
    print("I'm learning \(what).")
}

learningWhat("swift")

//let learningResult = { (something: String) -> String in
//    var str = "hhh" + something
//    return str
//}
//
//let result = learningResult("ggg")


//: [Next](@next)
