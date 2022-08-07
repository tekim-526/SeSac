//
//  LocationViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/29.
//

import UIKit
import MapKit

/*
 - 권한 허용 해야만 알림이 온다.
 - 권한 허용 문구 시스템적으로 최초 한번만 뜬다.
 - 허용 안된 경우 애플 설정으로 직접 유도하는 코드를 구성해야 한다.
 
 - 기본적으로 알림은 포그라운드에서 수신이 되지 않는다.
 - 로컬 알림에서는 60초 이상 반복 가능 / 갯수 재한 64개 / 커스텀 사운드 30초
 
 시점에 대한 생각이 필요
 1. 뱃지제거 -> SceneDelegate -> sceneDidBecomeActive
 2. 노티제거 -> 노티의 유효 기간은? -> 카톡(오픈채팅, 단톡)
 3. 포그라운드 수신 -> AppDelegate -> UNUserNotificationCenterDelegate -> delegate 메서드(will present)로 해결
 
 +a
 - 노티는 앱 실행이 기본, 특정 노티를 클릭할 때 특정 화면으로 가고 싶다면?
 - iOS15 집중모드 등 5~6 우선순위 존재
 */

class LocationViewController: UIViewController {
    // LocationViewController.self 메타 타입 => "LocationViewController"
    

    // Notification
    let notificationCenter = UNUserNotificationCenter.current()
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        requestAuthorization()
    }
    
    @IBAction func downloadButton(_ sender: UIButton) {
        let url = "https://apod.nasa.gov/apod/image/2208/M13_final2_sinfirma.jpg"
        print("func", Thread.isMainThread)
        
        DispatchQueue.global().async {
            print("global", Thread.isMainThread)
            let data = try! Data(contentsOf: URL(string: url)!)
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                print("main", Thread.isMainThread)
                self.imageView.image = image
            }
        }
    }
    // Notification 2.권한 요청
    func requestAuthorization() {
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            if success {
                self.sendNotification()
            }
        }
    }
    
    // Notification 3. 권한 허용한 사용자에게 알림 요청(언제?, 어떤 컨텐츠?)
    // iOS 시스템에서 알림을 담당 > 알림 등록
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "다마고치를 키워보세)"
        notificationContent.body = "저는 따끔따끔 다마고치입니다"
        notificationContent.badge = 40
        
        // 언제 보낼것인가? 1. 시간 간격, 2. 캘린더, 3. 위치
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        var dateComponents = DateComponents()
        dateComponents.minute = 12
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        // 알림 요청
        // identifier: 매번 다르게 하고 싶을 때 -> "\(Date())"
        let request = UNNotificationRequest(identifier: "a", content: notificationContent, trigger: calendarTrigger)
        notificationCenter.add(request)
    }
    @IBAction func notificationButtonTapped(_ sender: UIButton) {
        sendNotification()
    }
}
