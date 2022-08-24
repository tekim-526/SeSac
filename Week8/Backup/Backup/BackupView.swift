//
//  BackupView.swift
//  Backup
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit
import SnapKit
class BackupView: BaseView {
    let backupButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setTitle("백업", for: .normal)
        return view
    }()
    let restoreButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .black
        view.setTitle("복구", for: .normal)
        return view
    }()
    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureUI() {
        [backupButton, restoreButton, tableView].forEach { self.addSubview($0) }
    }
    override func makeConstraints() {
        backupButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.equalTo(0)
            make.width.height.equalTo(180)
            
            
        }
        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            
            make.trailing.equalTo(0)
            make.width.height.equalTo(180)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(restoreButton.snp.bottom)
            make.trailing.leading.equalTo(0)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
