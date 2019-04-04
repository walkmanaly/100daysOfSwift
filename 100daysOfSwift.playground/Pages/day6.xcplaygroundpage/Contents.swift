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

// 3、带参数和返回值的闭包
let learningResult = { (something: String) -> String in
    return "Learn " + something
}

let result = learningResult("swift")
print(result)

// 4、把闭包作为参数传递

func travelLearning(learn:() -> Void) {
    print("before")
    learn()
    print("after")
}

travelLearning(learn: learning)

// 5、尾随闭包：如果传递给方法的最后一个参数是闭包，则可用此简写（尾随闭包是一种简写）

travelLearning {
    print("I'm learning swift!")
}
// 6-9加30-34行 ==等价于== 40-42行 将传递给一个方法的闭包及其定义两步简写成一步 syntax sugar


travelLearning {
    print("middle")
}

//: [Next](@next)
