//: [Previous](@previous)

import Foundation

// 复习
// 1、Typecasting类型推导
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Student: Person {
    var score: Double
    init(name: String, score: Double) {
        self.score = score
        super.init(name: name)
    }
}

class Teacher: Person {
    var subject: String
    init(name: String, subject: String) {
        self.subject = subject
        super.init(name: name)
    }
}

let jack = Student(name: "jack", score: 90.5)
let rose = Student(name: "rose", score: 85.5)
let teac = Teacher(name: "missli", subject: "English")

let allPersons = [jack, rose, teac]

for person in allPersons {
    if let student = person as? Student {
        print("\(student.name) score is \(student.score)")
    } else if let teacher = person as? Teacher {
        print("\(teacher.name) is a \(teacher.subject) teacher")
    }
}


//: [Next](@next)
