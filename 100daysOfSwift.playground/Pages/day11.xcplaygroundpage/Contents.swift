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

// 3、extension：可给已出现的类型添加方法（行为）
extension Int {
    func square() -> Int {
        return self * self
    }
}

var number = 10
number.square()
// extension：可给已出现的类型添加属性（只能是计算型属性，不能添加存储型属性）
extension Int {
    var isOddNumer: Bool {
        return self % 2 != 0
    }
}
number.isOddNumer

// 4、Protocol extensions：协议扩展。协议定义了一个是否有某种行为，却没有实现；扩展提供了行为实现，却只能影响一种数据类型。协议扩展同时完成了这两项工作
let citys = ["winterfell", "kingslanding", "castalrock"]
let names = Set(["cerssi", "joferley", "hound"])

extension Collection {
    func summerise() {
        for name in self {
            print(name)
        }
    }
}

citys.summerise()
names.summerise()

// 面向协议编程:protocol-oriented programming:协议扩展，在扩展中提供协议中的方法的默认实现
protocol Enable {
    var able: String {get set}
    func whatable()
}

extension Enable {
    func whatable() {
        print("My able is \(able)")
    }
}

struct Readable: Enable {
    var able: String
}
let readable = Readable(able: "read")
readable.whatable()

// test1
protocol Buyable {
    // property in protocol must have explicit { get } or { get set } specifier
//    var cost: Int
    var cost: Int { get }
}
protocol Sellable {
    func findBuyers() -> [String]
}
protocol FineArt: Buyable, Sellable { }

// test2
extension String {
    // String是值类型，所以这里扩展self是不可变的，要加上mutating关键字
    mutating func append(_ other: String) {
        self += other
    }
}

// test3 extension中的方法名不是protocol中定义的方法名，虽然编译器不报错，但不符合POP
protocol SuperHeroMovie {
    func writeScript() -> String
}
extension SuperHeroMovie {
    func makeScript() -> String {
        return """
        Lots of special effects,
        some half-baked jokes,
        and a hint of another
        sequel at the end.
        """
    }
}

// test4


//: [Next](@next)
