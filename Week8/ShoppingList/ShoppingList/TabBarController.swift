//
//  TabBarController.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/27.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let searchVC = ShoppingListViewController()
        let calendarVC = CalendarViewController()
        let backupVC = BackupViewController()
        
        searchVC.title = "Home"
        searchVC.tabBarItem.image = UIImage(systemName: "house")
        
        calendarVC.title = "Calendar"
        calendarVC.tabBarItem.image = UIImage(systemName: "calendar")
        
        backupVC.title = "Backup"
        backupVC.tabBarItem.image = UIImage(systemName: "repeat")
        
        
        setViewControllers([searchVC, calendarVC, backupVC], animated: false)
    }
    

}
