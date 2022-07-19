//
//  SettingTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/18.
//

import UIKit

class SettingTableViewController: UITableViewController {
    var birthdayFriends = ["웅", "영훈", "오석", "영민", "채원"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80 // default = 44
        
    }
    
    // 섹션의 갯수 (옵션)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "생일인 친구"
        } else if section == 1{
            return "즐겨찾기"
        } else if section == 2{
            return "친구"
        } else {
            return "unidentified"
        }
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "footer"
    }
    // 1. 셀의 갯수 (필수)
    // ex. 카톡 100명 > 셀 100개, 3000명 > 셀 3000개
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return birthdayFriends.count
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 15
        } else {
            return 0
        }
    }
    // 2. 셀의 디자인과 데이터(필수)
    // ex. 프로필 사진 상태 메시지 등
    // 재사용 메커니즘
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cell for row at", indexPath)
        
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "rightDetailCell")!
            cell.textLabel?.text = "오공"
            cell.textLabel?.textColor = .systemPurple
            cell.textLabel?.font = .boldSystemFont(ofSize: 15)
            cell.detailTextLabel?.text = "오반"
            
            cell.imageView?.image = indexPath.row % 2 == 0 ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
            cell.imageView?.tintColor = indexPath.row % 2 == 0 ? .black : .brown
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
            
            if indexPath.section == 0 {
                cell.textLabel?.text = birthdayFriends[indexPath.row]
                cell.textLabel?.textColor = .systemMint
                cell.textLabel?.font = .boldSystemFont(ofSize: 20)
            } else if indexPath.section == 1{
                cell.textLabel?.text = "셀"
                cell.textLabel?.textColor = .systemPink
                cell.textLabel?.font = .italicSystemFont(ofSize: 25)
            }
            return cell
        }
    }
    
    // cell 높이 조절(옵션, 빈도 높은) (feat. tableView.rowHeight)
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == [0, 0] {
            return 88
        }
        return 44
    }
}
