import UIKit

enum DrinkSize {
    case short, tall, grande, venti
}
class DrinkClass {
    let name: String
    var count: Int
    var size: DrinkSize
    init(name: String, count: Int, size: DrinkSize) {
        self.name = name
        self.count = count
        self.size = size
    }
}
struct DrinkStruct {
    let name: String
    var count: Int
    var size: DrinkSize
}

let drinkClass = DrinkClass(name: "스무디", count: 2, size: .venti)
var drinkStruct = DrinkStruct(name: "스무디", count: 2, size: .short)
print(drinkStruct.name, drinkStruct.count, drinkStruct.size)

struct Poster {
    var image: UIImage = UIImage(named: "star") ?? UIImage()
    init() {
        print("poster init")
    }
    
}

struct MediaInfo {
    var mediaTitle: String
    var mediaRuntime: Int
    // 지연 저장 프로퍼티
    lazy var mediaPoster: Poster = Poster()
}

var media = MediaInfo(mediaTitle: "오징어 게임", mediaRuntime: 123)
media.mediaPoster

struct User {
    static let name = "고래밥"
    static let age = 33
}
User.name // 호출하는 시점에 메모리에 올라감
