//
//  ViewController.swift
//  Backup
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit

class BackupViewController: BaseViewController {
    
    let backupView = BackupView()
    override func loadView() {
        view = backupView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        backupView.tableView.delegate = self
        backupView.tableView.dataSource = self
    }
    override func configureUI() {
        backupView.backupButton.addTarget(self, action: #selector(backupButtonTapped), for: .touchUpInside)
        backupView.restoreButton.addTarget(self, action: #selector(restoreButtonTapped), for: .touchUpInside)
    }
    @objc func backupButtonTapped() {
        print(#function)
    }
    @objc func restoreButtonTapped() {
        print(#function)
    }
}
extension BackupViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
