//: [Previous](@previous)

import Foundation

// 1、optional

var age: Int? = nil
age = 18

// 2、使用optional的值：使用if let gf如果有值使用，没有就走else
var name: String? = nil

if let unwrapping = name {
    print("name is \(unwrapping)")
} else {
    print("unwrapping error")
}







//: [Next](@next)
