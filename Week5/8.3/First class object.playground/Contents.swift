import UIKit

// MARK: - 일급 객체 & 클로저
// 스위프트 언어의 특성 1. 객체지향, 2. 함수형 프로그래밍, 3. 프로토콜 지향형 프로그래밍

/*
 1. 변수나 상수에 대입할 수 있다
 2. 인자값(파라미터)로 들어갈 수 있다
 */

func checkBankInformation(bank: String) -> Bool {
    let bankArray = ["우리", "국민", "신한"]
    return bankArray.contains(bank) ? true : false
}

// 리턴값을 넣어줌 -> 함수가 실행된 상태
let checkResult = checkBankInformation(bank: "우리")

// 함수 자체를 대입 실행된 상태 아님
let checkAccount = checkBankInformation

// (String) -> Bool 앞에는 튜플 느낌으로 생각하면 됨
let tuple: (Int, Int, Bool, String) = (1, 1, true, "12")
tuple.3

// 호출 해 주어야 실행이 된다
checkAccount("국민")


//오버로딩 된 경우
func hello(username: String) -> String {
    return username + "입니다"
}
func hello(nickname: String) -> String {
    return nickname + "입니다"
}
func hello(username: String, age: Int) -> String {
    return username + " " + "\(age)살 입니다"
}

// 오버로딩 특성으로 함수를 구분하기 힘들 때, 타입 어노테이션으로 구별 가능
// 타입 어노테이션으로 구분 힘든 경우 있음 -> 함수 표기법을 사용하면 된다
let result: (String) -> String = hello(nickname:)
result("rlaxotn")

let result2: (String) -> String = hello(username:)
result2("rlaxotn2")
let ageResult: (String, Int) -> String = hello
ageResult("rlaxotn", 26)

func evenNumber() {
    print("짝수")
}

func oddNumber() {
    print("홀수")
}

func resultNumber(number: Int, odd: () -> (), even: () -> ()) {
    return number.isMultiple(of: 2) ? even() : odd()
}
resultNumber(number: 200, odd: oddNumber, even: evenNumber)
resultNumber(number: 101) { 
    <#code#>
} even: {
    <#code#>
}
