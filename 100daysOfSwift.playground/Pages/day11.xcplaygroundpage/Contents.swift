//: [Previous](@previous)

import Foundation

// protocol
// 1、t如果你遵循某个协议，你要实现它声明的所有的属性和方法
protocol Identityble {
    var id: String {get set}
}
// User struct 遵循了这个协议
struct User: Identityble {
    var id: String
}

let oneUser = User(id: "9527")
// Person 类 遵循了这个协议
class Person: Identityble {
    var id: String
    init(id: String) {
        self.id = id
    }
}

let onePerson = User(id: "007")

// 只要遵循了Identityble协议的对象都可传进此方法，不管什么类型
func identities(thing: Identityble) {
    print("My id is \(thing.id)")
}

identities(thing: oneUser)
identities(thing: onePerson)


// 2、protocol继承,可多继承
protocol Payable {
    func canPay() -> Int
}

protocol Workable {
    func workHard()
}

protocol Vocationable {
    func goOnVocation() -> String
}

// Emplyee继承了上述三个protocol，同时拥有以上三个protocol的特性，而不需要在定义
protocol Emplyee: Payable, Workable, Vocationable {}

// Employ遵循了Emplyee协议，所以要实现这三个协议所以的方法（和属性）
struct Employ: Emplyee {
    func canPay() -> Int {
        return 1_000
    }
    func workHard() {
        print("work vary hard")
    }
    func goOnVocation() -> String {
        return "being vocation now"
    }
}


//: [Next](@next)
