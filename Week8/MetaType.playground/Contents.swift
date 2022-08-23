import UIKit

/*
 - MetaType: 클래스, 구조체, 열거형 유형 그 가리킴
 - String 타입은 String.Type
 */

struct User {
    let name = "tekim"
    static let originalName = "Kim Tae Su"
}
let user = User()
user.name

User.originalName
User.self.originalName

/*
 Swift Error Handling
 - try!
 - do try catch
 */

func validateUserInput(text: String) throws -> Bool {
    guard !(text.isEmpty) else {
        throw ValidationError.emptyString
    }
    
    guard Int(text) != nil else {
        throw ValidationError.isNotInt
    }
    return true
}

enum ValidationError: Error {
    case emptyString
    case isNotInt
    case isNotDate
    case callLimit
}

do {
    try validateUserInput(text: "j")
} catch ValidationError.emptyString {
    print("Empty")
} catch ValidationError.isNotInt {
    print("Not Int")
} catch {
    print("ERROR")
}
