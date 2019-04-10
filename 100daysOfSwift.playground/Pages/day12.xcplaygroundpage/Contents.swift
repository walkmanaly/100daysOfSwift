//: [Previous](@previous)

import Foundation

// 1、optional

var age: Int? = nil
age = 18

// 2、使用optional的值：使用if let 如果有值使用，没有就走else
var name: String? = nil

if let unwrapping = name {
    print("name is \(unwrapping)")
} else {
    print("unwrapping error")
}

// 3、使用guard

func usingName(_ name: String?) {
    guard let unwrapName = name else {
        print("name is empty")
        return
    }
    print("the name is \(unwrapName)")
}

usingName("nick")
usingName(nil)

// 4、强制解包，在你确认某个变量一定有值时使用，你也可以用来做crash调试（在指定位置crash）
let str = "5"
let five = Int(str)!
print(five)

// 5、隐式解包,在声明的时候强制解包，在后续使用就不需要解包了
var someName: String! = nil
someName = "Nick"

// 6、nil coalesing：？？操作符，有值用之，没有值用右边的默认值
func userName(_ number: Int) -> String? {
    if number == 1 {
        return "Nick"
    } else {
        return nil
    }
}

let oName = userName(11) ?? "Rose"

// 7、optional chaining：a.b?.c，swift会检查，如果b返回nil，这个表达式会立刻返回nil不管后续的操作；如果返回其他值，继续后续操作
let names = ["Nick", "Rose", "Jack"]

let result = names.first?.uppercased()


// 8、try optional
enum ErrorType: Error {
    case obvis
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw ErrorType.obvis
    }
    return true
}

do {
    try checkPassword("password")
    print("that is not good")
} catch {
    print("you can use it")
}

if let password = try? checkPassword("97697") {
    print("pass word \(password)")
} else {
    print("error")
}
try? checkPassword("123789")
//try! checkPassword("password") // 此处try！会crash，进入了error

// 9、 failable initializer:有可能返回你来实例的初始化方法
struct identity {
    var id: String
    init?(id: String) {
        if id.count == 9 {
            self.id = id
        } else {
            return nil
        }
    }
}

let id = identity(id: "769708797")
print(id)

// 10、Typecasting
class Animal {
    
}
class Dog: Animal {
    func makeNosie() {
        print("wang cai")
    }
}

class Bird: Animal {
    
}

let animals = [Dog(), Bird(), Dog(), Bird()]
for item in animals {
    if let pat = item as? Dog {
        pat.makeNosie()
    }
}
// test1
var bestScore: Int? = nil
bestScore = 101
if bestScore! > 100 {
    print("You got a high score!")
} else {
    print("Better luck next time.")
}
// test2
var score: Int? = nil
score = 556
if let playerScore = score {
    print("You scored \(playerScore) points.")
}
// test3
let menuItems: [String]? = ["Pizza", "Pasta"]
if let items = menuItems {
    print("There are \(items.count) items to choose from.")
}
// test4
func username(for id: Int?) -> String? {
    guard let id = id else {
        return nil
    }
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
if let user = username(for: 1989) {
    print("Hello, \(user)!")
}
// test5
func brewBeer(to strength: Double?) {
    guard let strength = strength else { return }
    print("Let's brew some beer!")
}
brewBeer(to: 5.5)






//: [Next](@next)
