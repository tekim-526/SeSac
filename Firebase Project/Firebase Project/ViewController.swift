//
//  ViewController.swift
//  Firebase Project
//
//  Created by Kim TaeSoo on 2022/10/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController ViewWillAppear")
    }

    @IBAction func profileButtonTapped(_ sender: UIButton) {
        present(ProfileViewController(), animated: true)
    }
    @IBAction func settingButtonTapped(_ sender: UIButton) {
        navigationController?.pushViewController(SettingViewController(), animated: true)
    }
    
}

class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ProfileViewController ViewWillAppear")
    }
}

class SettingViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("SettingViewController ViewWillAppear")
    }}


extension UIViewController {
    
    var topViewController: UIViewController? {
        return self.topViewController(currentViewController: self)
    }
    
    // 최상위 뷰 컨트롤러를 판단해주는 메서드
    func topViewController(currentViewController: UIViewController) -> UIViewController {
        if let tabBarController = currentViewController as? UITabBarController, let selectedViewController = tabBarController.selectedViewController {
            
            return self.topViewController(currentViewController: selectedViewController)
        } else if let navigationController = currentViewController as? UINavigationController, let visibleViewController = navigationController.visibleViewController {
            
            return self.topViewController(currentViewController: visibleViewController)
        } else if let presentedViewController = currentViewController.presentedViewController {
           
            return self.topViewController(currentViewController: presentedViewController)
        } else {
            return currentViewController
        }
    }
    
}

extension UIViewController {
    class func swizzleMethod() {
        let origin = #selector(viewWillAppear)
        let change = #selector(changeViewWillAppear)
        
        guard let originMethod = class_getInstanceMethod(UIViewController.self, origin),
              let changeMethod = class_getInstanceMethod(UIViewController.self, change) else { return }
        method_exchangeImplementations(originMethod, changeMethod)
        
    }
    @objc func changeViewWillAppear() {
        print("Change ViewWillAppear Succeed")
    }
}
