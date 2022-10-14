//: [Previous](@previous)

import Foundation

struct User: Encodable {
    let name: String
    let signDate: Date
    let age: Int
}

let users: [User] = [
    User(name: "tekim", signDate: Date(), age: 26),
    User(name: "tepark", signDate: Date(timeIntervalSinceNow: 86400), age: 29),
    User(name: "telee", signDate: Date(timeIntervalSinceNow: -86400), age: 100)
]

//dump(users)


let formatter = DateFormatter()
formatter.locale = Locale(identifier: "ko_KR")
formatter.dateFormat = "MM월 dd일 EEEE"

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
encoder.dateEncodingStrategy = .formatted(formatter)

do {
    let result = try encoder.encode(users)
    print(result)
    guard let jsonString = String(data: result, encoding: .utf8) else { fatalError("error") }
    print(jsonString)
} catch {
    print(error)
}

//: [Next](@next)
