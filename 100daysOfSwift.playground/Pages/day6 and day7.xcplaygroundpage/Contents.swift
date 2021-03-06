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

// 6、传递带参数的闭包
func travalLearningWhat(_ what:(String) -> Void) {
    print("learningWhat begin")
    what("swift")
    print("learningWhat end")
}

// 带参数的闭包做为参数传递给方法
travalLearningWhat({ (something: String) in
    print("I'm learning \(something).")
})
travalLearningWhat(learningWhat)
// 同上，这是尾随闭包写法
travalLearningWhat { (something: String) -> Void in
        print("learning \(something)")
}

// 7、带参数和返回值的闭包作为参数传递给方法
func travalLearningResult(result: (String) -> String) {
    print("before time")
    let res = result("swift")
    print(res)
    print("end time")
}

travalLearningResult(result: { (something: String) -> String in
    return something + " normal"
})

travalLearningResult { (something: String) -> String in
    return something + " trailing"
}

// 8、省略参数（带一个参数和一个返回值）,此处代码等价于79-81行：swift知道接收的是一个String可以省略并使用默认参数$0;也知道要返回值，也可省略return
travalLearningResult {
    $0 + " omit parameters"
}

// 9、省略参数（带两个参数和一个返回值）
func travalLearningResults (result: (String, Int) -> String) {
    print("start learning")
    let res = result("swift", 10)
    print(res)
    print("end learning")
}

// 尾随闭包写法
travalLearningResults {
    $0 + " \($1) hours"
}

// 10、带一个参数没有返回值的closure作为返回值
func action() -> (String) -> Void {
    return {
        print("the action is \($0)")
    }
}

// closure捕获变量
func actionCapture() -> (String) -> Void {
    var count = 0
    return {
        count += 1
        print("Times: \(count) capture something: \($0)")
    }
}

// 返回的closure捕获了变量count
let capture = actionCapture()
capture("Nick")
capture("Rose")
capture("Jack")

//: [Next](@next)
