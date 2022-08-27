//
//  ViewController.swift
//  Backup
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit

import Zip

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
        // 1-1. 도큐먼트 위치에 백업 파일 확인
        var urlPaths = [URL]()
        // 1-2. ~/Document => URL.Type
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "폴더를 찾을 수 없습니다.")
            return
        }
        // 1-3. ~/Document/default.realm => URL.Type
        let realmFile = path.appendingPathComponent("default.realm")
        
        // 1-4. ~/Document/default.realm => String.Type
        guard FileManager.default.fileExists(atPath: realmFile.path) else {
            showAlertMessage(title: "백업할 파일이 없습니다")
            return
        }
        // 1-5. append
        urlPaths.append(URL(string: realmFile.path)!)
        
        // 2-1. 백업 파일을 압축 -> 백업 파일의 URL생성
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "SesacDiary_1")
            print("Archive Location: \(zipFilePath)")
            showActivityViewController()
        } catch {
            showAlertMessage(title: "압축을 실패했습니다")
        }
        // ActivityViewController
        
    }
    @objc func restoreButtonTapped() {
        print(#function)
    }
    func showActivityViewController() {
        
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "폴더를 찾을 수 없습니다.")
            return
        }
        let backupFileURL = path.appendingPathComponent("SesacDiary_1.zip")
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        self.present(vc, animated: true)
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
