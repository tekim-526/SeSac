import UIKit

var formatter: DateFormatter = DateFormatter()
formatter.dateFormat = "yyyy년 MM월 dd일 hh시 mm분"
//formatter.locale = Locale(identifier: "ko_KR")

let date: Date = Date(timeIntervalSinceNow: 60 * 60 * 24)

let dateToString: String = formatter.string(from: date)
let stringToDate: Date = formatter.date(from: "2022년 7월 15일 12시 47분")!

print(dateToString)
print(stringToDate)
