//
//  ViewController.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/08.
//

import UIKit
import SwiftyJSON

/*
 1. html tag <> </> 기능 활용
 2. 문자열 대체 메서
 */
/*
 TableView automaticDimension
 - 컨텐츠 양에 따라서 셀 높이가 자유롭게
 - 조건: 레이블 numberOfLines 0
 - 조건: tableView Height automaticDimension
 - 조건: 레이아웃을 굉장히 잘 잡아야 한다
 */

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var blogList: [String] = []
    private var cafeList: [String] = []
    
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension // 모든섹션의 셀에 대해서 유동적!
        
        searchBlog()
    }
    
    private func searchBlog() {
        KakaoAPIManager.shared.callRequest(type: .blog, query: "고래밥") { json in
            for item in json["documents"].arrayValue {
                let value = item["contents"].stringValue.replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "<b>", with: "")
                
                self.blogList.append(value)
            }
            // tableview 갱신하거나, 네트워크를 다시 호출하거나
            self.searchCafe()
        }
    }
    
    private func searchCafe() {
        KakaoAPIManager.shared.callRequest(type: .cafe, query: "고래밥") { json in
            for item in json["documents"].arrayValue {
                
                let value = item["contents"].stringValue.replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "<b>", with: "")
                
                
                
                self.cafeList.append(value)
            }
            self.tableView.reloadData()
//            print(self.cafeList, "\n")
//            print(self.blogList)
        }
    }
    
    @IBAction func expandCell(_ sender: UIBarButtonItem) {
        isExpanded.toggle()
        tableView.reloadData()
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? blogList.count : cafeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KakaoCell", for: indexPath) as? KakaoCell else { return UITableViewCell() }
        cell.testLabel.text = indexPath.section == 0 ? blogList[indexPath.row] : cafeList[indexPath.row]
        cell.testLabel.numberOfLines = isExpanded ? 0 : 2
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "블로그 검색 결과" : "카페 검색 결과"
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 조건을 넣어준 경우
        // return indexPath.section == 1 ? UITableView.automaticDimension : 100
        return UITableView.automaticDimension
    }
    
}

class KakaoCell: UITableViewCell {
    @IBOutlet weak var testLabel: UILabel!
    
}
