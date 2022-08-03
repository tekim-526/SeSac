//
//  SearchViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/27.
//

import UIKit

/*
 Swift Protocol
 - Delegate
 - Data Source
 
 1. 왼팔 / 오른팔
 2. 테이블뷰 아웃렛 연결
 3. 1 + 2
 
 */


class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTableView.backgroundColor = .clear
        // 테이블 뷰가 해야할 역할 > 뷰 컨트롤러에 요청
        searchTableView.delegate = self
        searchTableView.dataSource = self
        // 테이블 뷰가 사용할 테이블뷰 셀(XIB) 등록
        // XIB: xml Interface Builder 이전에는 NIB 사용했었음
        searchTableView.register(UINib(nibName: ListTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ListTableViewCell.reuseIdentifier)
        
        let format = DateFormatter()
        format.dateFormat = "yyyyMMdd"
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let dateResult = format.string(from: yesterday!)
        print(yesterday)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        cell.titleLabel.font = .boldSystemFont(ofSize: 22)
        cell.titleLabel.text = "HELLO - \(indexPath.row + 1)"
        cell.backgroundColor = .clear
        return cell
    }

}

extension UIViewController {
    func setBackGroundColor() {
        view.backgroundColor = .red
    }
}
