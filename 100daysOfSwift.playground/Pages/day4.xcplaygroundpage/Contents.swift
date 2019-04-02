//: [Previous](@previous)

import Foundation

// loop 循环
let count = 1...10
for number in count {
    print("Number loop \(number)")
}

let abulm = ["james blumt", "talor swift", "coldplay"]
for singer in abulm {
    print("\(singer) is on apple music")
}

// _可以省略参数
for _ in 1..<6 {
    print("let's loop")
}

// while循环
var student = 0
while student <= 10 {
    print("student no. \(student)")
    student += 1
}

// repeat执行一次后，再判断循环
var person = 1
repeat {
    print("person \(person)")
    person += 1
} while person <= 10

// break 跳出循环语句
var countDown = 11
while countDown >= 0 {
    print("begin count \(countDown)")
    if countDown == 5 {
        break
    }
    countDown -= 1
}

print("I's boring, end countDown!")

// 跳出外层循环，当内层条件满足时，跳出外层循环（在外层循环前面添加一个label，符合条件时，break此label）
outLoop: for i in 1...10 {
    for j in 1...10 {
        print("\(i) * \(j) = \(i * j)")
        if i * j == 50 {
            print("break the loop!")
            break outLoop
        }
    }
}

//: [Next](@next)
