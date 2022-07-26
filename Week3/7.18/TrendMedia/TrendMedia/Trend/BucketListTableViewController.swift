//
//  BucketListTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class BucketListTableViewController: UITableViewController {
    static let identifier = "BucketListTableViewController"
    @IBOutlet weak var userTextField: UITextField!

    var list = ["범죄도시2", "탑건", "토르"]
    var textFieldPlaceHolder: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 88
        navigationItem.title = "버킷리스트"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeButtonTapped))
        userTextField.placeholder = textFieldPlaceHolder
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BucketListTableViewCell.identifier, for: indexPath) as! BucketListTableViewCell // 타입 캐스팅
        cell.bucketListLabel.text = list[indexPath.row]
        cell.bucketListLabel.font = .boldSystemFont(ofSize: 18)
        return cell
    }
    
    @objc func closeButtonTapped() {
        // self 생략 가능
        self.dismiss(animated: true)
    }
    
    
    
    
    
    @IBAction func userTextFieldReturn(_ sender: UITextField) {
// guard let 바인딩
        //        guard let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), (2...6).contains(value.count) else {
//            // 토스트 메시지 띄우기
//            return
//        }
//        list.append(value)
//        tableView.reloadData()
        
        if let value = sender.text?.trimmingCharacters(in: .whitespacesAndNewlines), !value.isEmpty, (2...6).contains(value.count) {
            list.append(value)
            sender.text = ""
            resignFirstResponder()
            
            // MARK: - 중요! -> table 뷰를 갱신함
            tableView.reloadData()
        } else {
            // 토스트메시지 띄우기
        }
        // 특정 section만 갱신
        // tableView.reloadSections(<#T##sections: IndexSet##IndexSet#>, with: <#T##UITableView.RowAnimation#>)
  
        // 특정 row만 갱신
        //tableView.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .automatic)
    }
    
    // MARK: - cell을 편집 가능한 상황으로 만들어줌
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // 우측 스와이프 디폴트 기능: commit editingStyle
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // 배열의 지우고자 하는 요소 삭제 후 테이블 뷰 갱신
            list.remove(at: indexPath.row)
//            tableView.reloadData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
//    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
    
//    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        <#code#>
//    }
}
