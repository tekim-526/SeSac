import UIKit

// 옵셔널로 선언된 프로퍼티는 nil을 가질 수 있는 상황. 나중에 초기화 가능
// nil을 담을 수 없는 프로퍼티는 값이 무조건 있어야함. 그래서 초기화 필요 -> 이니셜라이저
class Monster {
    var name: String
    var level: Int
    
    init(name: String, level: Int) {
        self.name = name
        self.level = level
    }
}

let easy = Monster(name: "easy", level: 1)
let hard = easy

easy.name = "boss"
easy.level = 100

print(easy.name, easy.level)
print(hard.name, hard.level)


struct StructMonster {
    var name: String
    let level: Int
}
var easy2 = StructMonster(name: "easy", level: 3)
easy2.name = "!23"

