//: [Previous](@previous)

import Foundation

// 1、optional

var age: Int? = nil
age = 18

// 2、使用optional的值：使用if let 如果有值使用，没有就走else
var name: String? = nil

if let unwrapping = name {
    print("name is \(unwrapping)")
} else {
    print("unwrapping error")
}

// 3、使用guard

func usingName(_ name: String?) {
    guard let unwrapName = name else {
        print("name is empty")
        return
    }
    print("the name is \(unwrapName)")
}

usingName("nick")
usingName(nil)



//: [Next](@next)
