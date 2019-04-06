//: [Previous](@previous)

import Foundation

// struct
struct Sport {
    var name: String
}

var sport = Sport(name: "basketball")
print(sport.name)
sport.name = "football"
print(sport.name)

// 计算型属性：并不存储值，而是通过计算其他属性得到的结果返回值
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

// 属性观察，属性在赋值前调用willSet，赋值后调用didSet。注意，在初始化时（创建实例时的属性值）不会触发属性观察的方法
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

// struct内部方法
struct City {
    var population: Int
    func doublePopulation() -> Int {
        return population * 2
    }
}

let shenzhen = City(population: 1_000_000)
print(shenzhen.doublePopulation())

//: [Next](@next)
