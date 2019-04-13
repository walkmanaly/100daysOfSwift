//: [Previous](@previous)

import Foundation

// 复习
// 1、Typecasting类型推导
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
    func description() {
        print("person name is \(name)")
    }
}

class Student: Person {
    var score: Double
    init(name: String, score: Double) {
        self.score = score
        super.init(name: name)
    }
    override func description() {
        print("student name is \(name), score is \(score)")
    }
}

class Teacher: Person {
    var subject: String
    init(name: String, subject: String) {
        self.subject = subject
        super.init(name: name)
    }
    override func description() {
        print("teacher name is \(name), teach the \(subject)")
    }
}

let jack = Student(name: "jack", score: 90.5)
let rose = Student(name: "rose", score: 85.5)
let teac = Teacher(name: "missli", subject: "English")

var allPersons = [jack, rose, teac]

for person in allPersons {
    person.description()
}

for person in allPersons {
    if let student = person as? Student {
        print("\(student.name) score is \(student.score)")
    } else if let teacher = person as? Teacher {
        print("\(teacher.name) is a \(teacher.subject) teacher")
    }
}

allPersons = [jack, rose]
// 因为确定allPersons里都是Student类型的对象，所以可以用as!强制转换（如果不确认就这么写，会crash，swift把这交给👨‍💻‍，如果crash你自己负责咯）
for person in allPersons as! [Student] {
    print("student \(person.name) score is \(person.score)")
}

// 如果数组h中全是Student类型对象则处理，否则创建一个空数组做默认处理
allPersons = [jack, rose, teac]
for person in allPersons as? [Student] ?? [Student]() {
    print("\(person.name) \(person.score)")
}

//: [Next](@next)
