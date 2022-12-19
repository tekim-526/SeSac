import UIKit

var chatData: [Int] = [Int]()

var chatArray: [Int] {
    get {
        return chatData.map {$0 }
    } set {
        print("inside set")
        chatData.removeAll()
        chatData.append(contentsOf: newValue)
    }
}

chatData.append(contentsOf: [123, 456, 789])
print("chatData :", chatData)
chatData.append(contentsOf: [123, 456, 789, 0])
print("chatArray :", chatArray)

chatData = [123, 123]
print("chatArray :", chatArray)
chatArray.append(9090)
print(chatArray)
