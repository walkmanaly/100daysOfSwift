//: [Previous](@previous)

import Foundation

// class
// class与struct的区别
// 1、class编译器不会默认生成初始化方法classes never come with a memberwise initializer,定义一个类，必须实现初始化方法，并保证所有属性都已初始化
class Dog {
    var name: String
    var feed: String
    init(name: String, feed: String) {
        self.name = name
        self.feed = feed
    }
}

let littleDog = Dog(name: "wangcai", feed: "meet")

/*
// 如果属性很多，初始化方法就要传递很多参数:可以定义属性时赋默认值
class Student {
    var name: String
    var age: Int
    var score: Double
    var gender: Bool
    var records: [Double]
    var height: Double?
    
    init(name: String, age: Int, score: Double, gender: Bool, records: [Double]) {
        self.name = name
        self.age = age
        self.score = score
        self.gender = gender
        self.records = records
    }
}

let littleStudent = Student(name:"22", age:18, score:22.2, gender:true, records:[22.3, 44.5])
*/

// 2、class有继承体系,子类初始化方法必须调用super保证父类实例已初始化
class Puppy: Dog {
    init(name: String) {
        super.init(name: name, feed: "meet")
    }
}

let puppy = Puppy(name: "wangwang")
print(puppy.name)

// 3、方法重载 override
class Person {
    func reading() {
        print("I'm reading book")
    }
}

class Student: Person {
    override func reading() {
        print("Doing Homework")
    }
}

let per = Person()
let stu = Student()
per.reading()
stu.reading()

// 4、final类：不允许被继承，也不允许修改其方法行为
final class Teacher {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    func teach() {
        print("begin teach")
    }
}

//: [Next](@next)
