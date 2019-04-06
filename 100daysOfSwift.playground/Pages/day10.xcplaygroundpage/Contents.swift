//: [Previous](@previous)

import Foundation

// class
// class与struct的区别
// 1、class编译器不会默认生成初始化方法classes never come with a memberwise initializer,定义一个类，必须实现初始化方法，并保证所有属性都已初始化
class Dog {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let littleDog = Dog(name: "wangcai", age: 8)








//: [Next](@next)
