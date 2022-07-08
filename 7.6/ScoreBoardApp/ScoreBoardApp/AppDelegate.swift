//
//  AppDelegate.swift
//  ScoreBoardApp
//
//  Created by Kim TaeSoo on 2022/07/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - 13.0 이전버전에서 실행하기 위해선 window를 AppDelegate안에 넣어주어야함
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(1)
        return true
    }
    
    // MARK: - iOS12 까지의 사용 방식
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 백그라운드로 들어갔을 떄
        // melon, youtube - 사용자가 프리미엄 결제 했으면 play, 아니면 일시정지
        
    }
    func applicationWillEnterForeground(_ application: UIApplication) {
        // 액티브 상황에 들어옴 -> 백그라운드에서 포그라운드로
        // youtube - 결제 안 한 사람에게 팝업창 띄워
        // 카카오톡 - 잠금화면에서 비밀번호
    }
    
    // MARK: UISceneSession Lifecycle
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

