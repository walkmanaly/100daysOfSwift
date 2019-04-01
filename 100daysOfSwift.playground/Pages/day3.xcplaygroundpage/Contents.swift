//: [Previous](@previous)

import Foundation

// 基础运算符
let firstScore = 13
let secondScore = 2

let sum = firstScore + secondScore
let diffent = firstScore - secondScore

let mutiple = firstScore * secondScore
let divid = firstScore / secondScore

let mord = firstScore % secondScore

// 重载运算符

let firstName = "Nick "
let lastName = "Stark"

let fullName = firstName + lastName

let names1 = ["rose", "jack"]
let names2 = ["arya", "branden"]

let allName = names1 + names2

// 复合运算符
var score = 80
score -= 3

var content = "hello there, ned stark is"
content += " a brave man"

// 比较运算符
/*
var firstNum = 5
var secondNum = 6

firstName == secondScore
firstName != secondScore

firstName > secondScore
firstName <= secondScore

"Nick" > "Stark"
 */

// if else
if firstScore + secondScore == 15 {
    print("yes correct")
} else if firstScore > secondScore {
    print("good")
} else {
    print("something wrong")
}

//: [Next](@next)
