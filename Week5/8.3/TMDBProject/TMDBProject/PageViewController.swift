//
//  PageViewController.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/16.
//

import UIKit

class PageViewController: UIPageViewController {
    var vcList: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendVCInList()
        configurePageView()
    }
    func appendVCInList() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc1 = sb.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        let vc2 = sb.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vcList = [vc1, vc2]
    }
    func configurePageView() {
        delegate = self
        dataSource = self
        guard let first = vcList.first else { return }
        setViewControllers([first], direction: .forward, animated: true)
    }
   
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = vcList.firstIndex(of: viewController) else { return nil }
        
        return viewControllerIndex - 1 < 0 ? nil : vcList[viewControllerIndex - 1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = vcList.firstIndex(of: viewController) else { return nil }
        return viewControllerIndex + 1 >= vcList.count ? nil : vcList[viewControllerIndex + 1]
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = vcList.firstIndex(of: first) else { return 0 }
        return index
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return vcList.count
    }
    
}
