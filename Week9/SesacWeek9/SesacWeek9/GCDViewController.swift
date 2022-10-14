//
//  GCDViewController.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/09/02.
//

import UIKit

class GCDViewController: UIViewController {
   
    let url1 = URL(string: "https://apod.nasa.gov/apod/image/2201/OrionStarFree3_Harbison_5000.jpg")!
    let url2 = URL(string: "https://apod.nasa.gov/apod/image/2112/M3Leonard_Bartlett_3843.jpg")!
    let url3 = URL(string: "https://apod.nasa.gov/apod/image/2112/LeonardMeteor_Poole_2250.jpg")!
    
    @IBOutlet weak var firstImage: UIImageView!
    
    @IBOutlet weak var secondImage: UIImageView!
    
    @IBOutlet weak var thiridImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    func trending() {/* API호출 코드 */}
    func genre() {/* API호출 코드 */}
    
    
    @IBAction func serialSync(_ sender: UIButton) {
        print("START")
        for i in 1...100 {
            print(i, terminator: " ")
        }
        DispatchQueue.main.sync { // 왜 문제가 생기는지 DeadLock
            for i in 101...200 {
                print(i, terminator: " ")
            }
        }
        print("END")
    }
    
    @IBAction func serialAsync(_ sender: UIButton) {
        print("START")
        DispatchQueue.main.async {
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            print(i, terminator: " ")
        }
        print("END")
    }
    
    @IBAction func concurrentSync(_ sender: UIButton) {
        print("START \(Thread.isMainThread)", terminator: " ")
        DispatchQueue.global().sync { // Main 쓰레드에서 동작하는것과 같기 때문에 굳이..?
            for i in 1...100 {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            print(i, terminator: " ")
        }
        print("END \(Thread.isMainThread)", terminator: " ")
    }
    
    @IBAction func concurrentAsync(_ sender: UIButton) {
        print("START \(Thread.isMainThread)", terminator: " ")
        //        DispatchQueue.global().async {
        //            for i in 1...100 {
        //                print(i, terminator: " ")
        //            }
        //        }
        
        for i in 1...100 {
            DispatchQueue.global().async {
                print(i, terminator: " ")
            }
        }
        
        
        for i in 101...200 {
            print(i, terminator: " ")
        }
        print("END \(Thread.isMainThread)")
    }
    
    @IBAction func qosButtonTapped(_ sender: UIButton) {
        
        let customQueue = DispatchQueue(label: "myCustom", qos: .userInteractive, attributes: .concurrent)
        
        for i in 1...100 {
            DispatchQueue.global(qos: .background).async {
                print(i, terminator: " ")
            }
        }
        
        for i in 101...200 {
            DispatchQueue.global(qos: .userInteractive).async {
                print(i, terminator: " ")
            }
        }
        
        for i in 201...300 {
            DispatchQueue.global(qos: .utility).async {
                print(i, terminator: " ")
            }
        }
        
        
    }
    
    @IBAction func dispatchGroup(_ sender: UIButton) {
        let group = DispatchGroup()
        
        DispatchQueue.global().async(group: group) {
            for i in 1...30 {
                print(i, terminator: " ")
            }
        }
        DispatchQueue.global().async(group: group) {
            for i in 31...60 {
                print(i, terminator: " ")
            }
        }
        DispatchQueue.global().async(group: group) {
            for i in 61...90 {
                print(i, terminator: " ")
            }
        }
        group.notify(queue: .main) {
            print("끝") // tableView.reload()
        }
    }
    
    @IBAction func nasaGroup(_ sender: UIButton) {
//        request(url: url1) { image in
//            print(1)
//            self.request(url: self.url2) { image in
//                print(2)
//                self.request(url: self.url3) { image in
//                    print(3)
//                    print("끝 갱신")
//                }
//            }
//        }
        let group = DispatchGroup()
        DispatchQueue.global().async(group: group) {
            self.request(url: self.url1) { image in
                print(1)
            }

        }
        DispatchQueue.global().async(group: group) {
            self.request(url: self.url2) { image in
                print(2)
            }
        }
        DispatchQueue.global().async(group: group) {
            self.request(url: self.url3) { image in
                print(3)
            }
        }
        
        group.notify(queue: .main) {
            print("끝")
        }
 
    }
    
    @IBAction func enterleaveGroup(_ sender: UIButton) {
        let group = DispatchGroup()
        
        
        var imageList: [UIImage?] = []
        
        group.enter() // RC + 1
        request(url: url1) { image in
            imageList.append(image)
            group.leave() // RC - 1
        }
        
        group.enter()
        request(url: url2) { image in
            imageList.append(image)
            group.leave()
        }
        
        group.enter()
        request(url: url3) { image in
            imageList.append(image)
            group.leave()
        }
        
        group.notify(queue: .main) {
            self.firstImage.image = imageList[0]
            self.secondImage.image = imageList[1]
            self.thiridImage.image = imageList[2]
            print("끝")
        }
        
    }
    
    @IBAction func raceCondition(_ sender: UIButton) {
        // 같은 변수에 접근하는 상황 Race Condition
        let group = DispatchGroup()
        var nickname = "0"
        
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
            nickname = "1"
            print("first: \(nickname)")
        }
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
            nickname = "2"
            print("second: \(nickname)")
        }
        DispatchQueue.global(qos: .userInteractive).async(group: group) {
            nickname = "3"
            print("third: \(nickname)")
        }
        group.notify(queue: .main) {
            print("result: \(nickname)")
        }
    }
    
    
    func request(url: URL, completionHandler: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                completionHandler(UIImage(systemName: "star"))
                return
            }
            
            let image = UIImage(data: data)
            completionHandler(image)
            
        }.resume()
    }
    
    
}
