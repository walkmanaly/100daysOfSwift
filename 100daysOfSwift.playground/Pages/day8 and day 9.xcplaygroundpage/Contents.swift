//: [Previous](@previous)

import Foundation

// 1、struct 创建struct的实例如果为let则该实例的属性也不能修改
struct Sport {
    var name: String
}

var sport = Sport(name: "basketball")
print(sport.name)
sport.name = "football"
print(sport.name)

// 2、计算型属性：并不存储值，而是通过计算其他属性得到的结果返回值
struct Sports {
    var name: String
    var isOlynpicSport: Bool
    var fullName: String {
        if isOlynpicSport {
            return "\(name) is olynpicSport"
        } else {
            return "\(name) is not olynpicSport"
        }
    }
}

let sports = Sports(name:"football", isOlynpicSport: true)
print(sports.fullName)

// 3、属性观察，属性在赋值前调用willSet，赋值后调用didSet。注意，在初始化时（创建实例时的属性值）不会触发属性观察的方法
struct Progress {
    var name: String
    var amount: Int {
        willSet {
            print("value before setting is \(amount)")
        }
        didSet {
            print("value after setting is \(amount)")
        }
    }
}

var myProgress = Progress(name: "loading", amount: 0)
myProgress.amount = 10
myProgress.amount = 20
myProgress.amount = 30

// 4、struct内部方法
struct City {
    var population: Int
    func doublePopulation() -> Int {
        return population * 2
    }
}

let shenzhen = City(population: 1_000_000)
print(shenzhen.doublePopulation())

// 5、struct中的方法如果要改变属性，必须明确标识mutating。因为swift默认是不允许方法去改变属性的
struct Person {
    var name: String
    mutating func changeName() {
        name = "Changed name"
    }
}

var rose = Person(name: "Rose")
print(rose.name)
rose.changeName()
print(rose.name)

// 6、String 字符串,关于字符串的操作还有很多...
let testStr = "Hello Swift!"
print(testStr.count)
print(testStr.hasPrefix("Hello"))
print(testStr.uppercased())
print(testStr.sorted())

// 7、Array 数组，关于数组的各种操作，更多查看API了解
var testArr = [String]()
testArr.append("Nick")
print(testArr.count)
print(testArr.sorted())
print(testArr.removeLast())
testArr.append("Jack")
print(testArr[0])
print(testArr.firstIndex(of: "Jack"))

// 8、初始化方法：struct编译器默认实现了一个初始化方法叫memberwise initializer，在创建实例时，所有属性都必须初始化
struct User {
    var name: String
    var age: Int
    /* 实际上，编译器生成了这些代码
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    */
}

let nick = User(name: "Nick", age: 18)

// 如果你手动实现了init方法，则调用手动实现，不再调用默认生成的初始化方法
struct Users {
    var name: String
    var age: Int
    init() {
        name = "Nick"
        age = 18
    }
}

var nicks = Users()
nicks.name = "Rose"
print("nicks name:\(nicks.name), age:\(nicks.age)")

// 9、self指向当前实例
struct People {
    var name: String
    var age: Int
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    // self可以更清楚分别出self.name表示属性，而name则表示参数
}

// 10、lazy懒加载属性
struct Detail {
    init() {
        print("Dispaly detail.")
    }
}
struct Persons {
    var name: String
    lazy var desc = Detail()
    
    init(name: String) {
        self.name = name
    }
}

var onePerson = Persons(name: "Jack")
// 不添加lazy关键字，每创建一个Persons实例都会调用；添加lazy关键字，在调用的时候才会执行（没用到时不创建，结束资源）
onePerson.desc


//: [Next](@next)
