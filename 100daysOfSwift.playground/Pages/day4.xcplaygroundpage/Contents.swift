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

//: [Next](@next)