import UIKit
import CoreServices
import Foundation

enum Name: String, CaseIterable {
    case taesu
    case kim
}

enum Grade: Double, CaseIterable {
    case aPlus = 4.5
    case a = 4.0
    case bPlus = 3.5
    case b = 3.0
    case cPlus = 2.5
    case c = 2.0
    case dPlus = 1.6
    case d = 1.0
    case f = 0.0
}

enum Rank: Int, CaseIterable {
    case first = 1
    case second
    case third
}

enum Sample: Int, CaseIterable {
    case three = 3
    case four
    case five
}

enum Sample2: Int, CaseIterable {
    case three = 3
    case four = 1
    case five
    
    // MARK: - rawValue는 열거형 내부에서 같은 값을 가질 수 없다
    // case six
}

for name in Name.allCases {
    print(name.rawValue)
}
print()
for grade in Grade.allCases {
    print(grade.rawValue)
}
print()
for rank in Rank.allCases {
    print(rank.rawValue)
}
print()
for num in Sample.allCases {
    print(num.rawValue)
}
print()
for num in Sample2.allCases {
    print(num.rawValue)
}
