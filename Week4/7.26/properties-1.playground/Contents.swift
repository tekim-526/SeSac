import UIKit

struct Poster {
    var image: UIImage = UIImage(named: "star") ?? UIImage()
    var asd = 1
    init() {
        print("Poster Initialized")
    }
}
var one = Poster()
var two = Poster()
var three = Poster()

struct User {
    static var originalName = "진짜이름"
    var nickname = "고래밥"
}


var user1 = User()
user1.nickname = "올라프"
User.originalName = "김김김"
print(user1.nickname, User.originalName)
var user2 = User()
print(user2.nickname, User.originalName)
var user3 = User()
print(user3.nickname, User.originalName)
var user4 = User()
print(user4.nickname, User.originalName)


// MARK: - 계산 속성

struct BMI {
    var nickname: String
    var weight: Double
    var height: Double
    
    // 저장프로퍼티를 활용해서 원하는 값을 반환하는 용도로 주로 사용
    var BMIResult: String {
        get {
            let bmiValue = weight / ((height / 100) * (height / 100))
            let bmiStatus = bmiValue < 18.5 ? "저체중" : "과체중"
            return "\(nickname)님의 BMI 지수는 \(bmiValue)로 \(bmiStatus)입니다"
        }
        set {
            nickname = newValue
        }
    }
}
var bmi = BMI(nickname: "김태수", weight: 80, height: 186)

//bmi.BMIResult = "tekim"
//print(bmi.BMIResult)
//bmi.nickname
class FoodRestaurant {
    let name = "kim chicken"
    var totalOrderCount = 10
    var nowOrder: Int {
        get {
            return totalOrderCount * 5000
        }
        set {
            totalOrderCount += newValue
        }
    }
}

let food = FoodRestaurant()
print(food.nowOrder)
food.totalOrderCount += 10
print(food.nowOrder)
food.nowOrder = 10
print(food.nowOrder)


// MARK: - 열거형은 타입 자체 > 인스턴스 생성이 불가능하다.
// 인스턴스 생성을 통해ㅓ 접근할 수 있는 인스턴스 저장 프로퍼티 사용 불가! 인스턴스 연산 프로퍼티는 사용 가능!
// 메모리의 관점과 + 열거형이 컴파일 타임에 확정되어야 한다!
enum ViewType: Int {
    case start
    case change
    
    var nickname: String {
        return "Aa"
    }
    static var title = "start"

}
// 타입프로퍼티는 인스턴스랑 상관없이 접근 가능! > 따라서 열거형에서 타입 저장 프로퍼티, 타입 연산 프로퍼티는 모두 사용 가능






















