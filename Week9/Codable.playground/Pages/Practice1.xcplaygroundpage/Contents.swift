//: [Previous](@previous)

import Foundation

let json = """
{
    "totSellamnt": 101318529000,
    "returnValue": "success",
    "drwNoDate": "2022-07-23",
    "firstWinamnt": 6118853344,
    "drwtNo6": 33,
    "drwtNo4": 25,
    "firstPrzwnerCo": 4,
    "drwtNo5": 29,
    "bnusNo": 7,
    "firstAccumamnt": 24475413376,
    "drwNo": 1025,
    "drwtNo2": 9,
    "drwtNo3": 20,
    "drwtNo1": 8
}
"""

struct Lotto: Codable {
    let totSellamnt: Int
    let returnValue, drwNoDate: String
    let firstWinamnt, drwtNo6, drwtNo4, firstPrzwnerCo: Int
    let drwtNo5, bnusNo, firstAccumamnt, drwNo: Int
    let drwtNo2, drwtNo3, drwtNo1: Int
}


guard let result = json.data(using: .utf8) else { fatalError("Error")}


let decoder = JSONDecoder()

//Data -> Quote
do {
    let value = try decoder.decode(Lotto.self, from: result)
    print(value)
    
} catch {
    print(error)
}

//: [Next](@next)
