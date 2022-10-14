import UIKit

class Guild {
    var owner: User?

    let name: String
    init(name: String) {
        self.name = name
        print("Guild Init")
    }
    deinit {
        print("Guild Deinit")
    }
}

class User {
    var guild: Guild?

    let user: String
    init(user: String) {
        self.user = user
        print(user)
    }
    deinit {
        print("User deinit")
    }
}

var guild: Guild? = Guild(name: "양재동 불주먹") // Guild RC:1
var user: User? = User(user: "유저 이름") // User RC:2

user?.guild = guild // Guild RC:2
guild?.owner = user // User RC:2

// 순환참조중인 요소를 먼저 nil -> weak, unowned
//guild?.owner = nil // User RC:1

user = nil // User RC:0, Guild RC:1
guild = nil // Guild RC:0


