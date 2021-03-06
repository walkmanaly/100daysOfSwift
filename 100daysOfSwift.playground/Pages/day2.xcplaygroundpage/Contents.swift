//: [Previous](@previous)

import Foundation

/*
 today learn types of:
    Array
    Dictionary
    Set
    Tuple
    Enum
 */
// Array

let orange = "orange"
let piapple = "piapple"
let apple = "apple"
let mango = "mango"

let food = [orange, piapple, apple, mango]
food[2]

let intArr: [Int] = [1, 2, 3, 4, 5]

intArr[4]

// Sets
// 与数组区别：1、无序 2、值不重复

let color1 = Set(["red", "blue", "orange"])

let color2 = Set(["red", "blue", "orange", "red", "blue"])

// tuple
let name = (first: "Talor", last: "Swift")
name.first
name.1

var myName = (first: "Nick", last: "Stark")
myName.0 = "Stark"
myName.last = "Nick"
myName

// Dictionary

let myInfomation = [
    "height": 62,
    "age": 28
]

myInfomation["height"]
myInfomation["age"]

let myInfo: [String: Any] = [
    "name": "Nick",
    "age": 28,
    "score": 95.5
]

// 获取字典值，如果取不到，返回默认值
myInfo["weight", default: "unknow"]

// 创建空的集合（array，set，dictionary）
// 字典
var teams = [String: String]()
teams["Nick"] = "good one"

var team = Dictionary<String, String>()
teams["name"] = "vitory"

// 数组
var ages = [Int]()
ages = [18, 28, 20]

var age = Array<Int>()
age = [60, 70, 65]
// 集合
var times = Set<String>()
times = ["min", "hour", "second"]

// enum枚举
enum Result {
    case success
    case failure
}

let result1 = Result.success
let result2 = Result.failure

// 枚举关联值,
enum Activity {
    case eating(food: String)
    case talking(topic: String)
    case sleepping
}

let sleep = Activity.sleepping
let eat = Activity.eating(food: "orange")
let talk = Activity.talking(topic: "football")

// rawValue
enum Planet: Int {
    case earth = 2
    case mars
    case nues
}

let planetInt = Planet.mars.rawValue

//: [Next](@next)
