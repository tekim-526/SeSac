import UIKit

// MARK: - 일급 객체 & 클로저
// 스위프트 언어의 특성 1. 객체지향, 2. 함수형 프로그래밍, 3. 프로토콜 지향형 프로그래밍

/*
 1. 변수나 상수에 대입할 수 있다
 2. 함수의 반환 타입으로 함수를 사용할 수 있다.
 3. 인자값(파라미터)로 들어갈 수 있다
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

// 2번특성 - 반환값으로 함수를 사용할 수 있다.

func currentAccount() -> String {
    return "계좌 있음"
}

func noCurrentAccount() -> String {
    return "계좌 없음"
}
// 가장 왼쪽에 위치한 "->" 를 기준으로 오른쪽에놓인 모든 타입은 반환값을 의미함
func checkBank(bank: String) -> () -> String{
    let bankArray = ["우리", "국민", "신한"]
    return bankArray.contains(bank) ? currentAccount : noCurrentAccount // 함수를 호출하는것이 아니라 반환 값을 던저준다
}
let kim = checkBank(bank: "국민")
checkBank(bank: "없당")()
kim()

// 2-1 계산기
func plus(a: Int, b: Int) -> Int {
    a + b
}
func minus(a: Int, b: Int) -> Int {
    a - b
}
func multiply(a: Int, b: Int) -> Int {
    a * b
}
func divide(a: Int, b: Int) -> Int {
    a / b
}
func calculate(operand: String) -> (Int, Int) -> Int {
    switch operand {
    case "+": return plus
    case "-": return minus
    case "*": return multiply
    case "/": return divide
    default: return plus
    }
}

calculate(operand: "*")// 실행되는 상태아님
let plusCalculate = calculate(operand: "+")
plusCalculate(5, 10)



// 3번 특성
func evenNumber() {
    print("짝수")
}

func oddNumber() {
    print("홀수")
}
// 어떤함수가 들어가던 상관이 없고, 타입만 잘 맞으면 된다
// 실질적인 연산은 파라미터에 들어가는 함수에 달려있다. 중개 역할만 담당하고 있어서 브로커라고 부름
func resultNumber(number: Int, odd: () -> (), even: () -> ()) {
    return number.isMultiple(of: 2) ? even() : odd()
}

// 매개변수로 함수를 전달한다.
resultNumber(number: 200, odd: oddNumber, even: evenNumber) // 의도하지 않음 함수가 들어갈 수 있음. 필요이상의 함수가 생김
resultNumber(number: 101) { // 이름없는 함수
    print(123)
} even: {
    print(234)
}

