//
//  KakaoSettingTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/18.
//

import UIKit

enum SettingOptions: Int, CaseIterable {
    case total, personal, others // section
    
    var sectionTitle: String {
        switch self {
        case .total:
            return "전체 설정"
        case .personal:
            return "개인 설정"
        case .others:
            return "기타"
        }
    }
    
    var sectionItem: [String] {
        switch self {
        case .total:
            return ["공지사항", "실험실", "버전 정보"]
        case .personal:
            return ["개인/보안", "알림", "채팅", "멀티프로필"]
        case .others:
            return ["고객센터/도움말"]
        }
    }
}


class KakaoSettingTableViewController: UITableViewController {

//    let wholeSetting: [String] = ["공지사항", "실험실", "버전 정보"]
//    let personalSetting: [String] = ["개인/보안", "알림", "채팅", "멀티프로필"]
//    let etc = "고객센터/도움말"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return SettingOptions.allCases.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        // MARK: - after refactor
        return SettingOptions.allCases[section].sectionItem.count

    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kakaoSettingCell")!
        cell.accessoryType = .disclosureIndicator
        // MARK: - after refactor
        cell.textLabel?.text = SettingOptions.allCases[indexPath.section].sectionItem[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // MARK: - after refactor
        return SettingOptions.allCases[section].sectionTitle
    }
    
}
