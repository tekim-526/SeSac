import UIKit

enum School: String {
    case elementary
    case middle
    case high
    case university
}

class Person {
    var age = 26
    var height = 186.1
    var weight = 77.8
}

class Student: Person {
    var school = School.university
    var grade = 4
}

var student = Student()
print("Hi! I'm \(student.age) years old, I'm attendance in \(student.grade)th grade of \(student.school)")

class TaeSu: Student {
    var name = "taesu"
}

var taesu = TaeSu()
print("Hi! My name is \(taesu.name) I'm \(taesu.age) years old, I'm attendance in \(taesu.grade)th grade of \(taesu.school)")

var kimTaeSu = taesu
kimTaeSu.name = "Kim Tae Su"

// MARK: - enum값도 상속이 된당
print("Hi! My name is \(taesu.name) I'm \(taesu.age) years old, I'm attendance in \(taesu.grade)th grade of \(taesu.school)")

struct Gym {
    var powerLifting = "powerLifting"
    var crossFit = "crossFit"
    var yoga = "yoga"
}
var gym = Gym()
var gym2 = gym
gym.yoga = "lululemon"
print(gym.yoga)
//var gym2 = gym <- 여기 위치에선 값이 바뀐 이후라서 적용이안됨 lululemon,lululemon
print(gym2.yoga)
