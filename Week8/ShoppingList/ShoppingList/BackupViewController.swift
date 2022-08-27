//
//  ViewController.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/25.
//


import UIKit
import Zip

class BackupViewController: BaseViewController, FileManagerProtocol {
    
    let backupView = BackupView()
    override func loadView() {
        view = backupView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        backupView.tableView.delegate = self
        backupView.tableView.dataSource = self
        
    }
    override func configureUI() {
        backupView.backupButton.addTarget(self, action: #selector(backupImageFolder), for: .touchUpInside)
        backupView.restoreButton.addTarget(self, action: #selector(restoreButtonTapped), for: .touchUpInside)
    }
    
    @objc func backupImageFolder() {
        var urlPaths = [URL]()
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "폴더를 찾을 수 없습니다")
            return
        }
        let imageFolder = path.appendingPathComponent("image")
        
        guard FileManager.default.fileExists(atPath: imageFolder.path) else {
            showAlertMessage(title: "이미지 폴더를 찾을 수 없습니다")
            return
        }
        urlPaths.append(URL(string: imageFolder.path)!)
        do {
            let zipFilePath = try Zip.quickZipFiles(urlPaths, fileName: "imageBackup")
            print("Archive Location: \(zipFilePath)")
            showActivityViewController(fileName: "imageBackup")
        } catch {
            print("error")
        }
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
            // ActivityViewController
            showActivityViewController(fileName: "SesacDiary_1")
        } catch {
            showAlertMessage(title: "압축을 실패했습니다")
        }
        
    }
    @objc func restoreButtonTapped() {
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.archive], asCopy: true)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        self.present(documentPicker, animated: true)
    }
    @objc func leftBarButtonItemTapped() {
        navigationController?.popViewController(animated: true)
    }
    func showActivityViewController(fileName: String) {
        print(#function)
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "폴더를 찾을 수 없습니다.")
            return
        }
        let backupFileURL = path.appendingPathComponent(fileName + ".zip")
        let vc = UIActivityViewController(activityItems: [backupFileURL], applicationActivities: [])
        print(backupFileURL)
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

extension BackupViewController: UIDocumentPickerDelegate {
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print(#function)
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let selectedFileURL = urls.first else {
            showAlertMessage(title: "선택하신 파일에 오류가 있습니다")
            return
        }
        guard let path = documentDirectoryPath() else {
            showAlertMessage(title: "도큐먼트 위치에 오류가 있습니다")
            return
        }
        let sandboxFileURL = path.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
            let fileURl = path.appendingPathComponent("SesacDiary_1.zip")
            do {
                try Zip.unzipFile(fileURl, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile : \(unzippedFile)")
                    self.showAlertMessage(title: "복구가 완료되었습니다")
                })
            } catch {
                showAlertMessage(title: "압축 해제에 실패했습니다")
            }
        } else {
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                
                let fileURl = path.appendingPathComponent("SesacDiary_1.zip")
                
                try Zip.unzipFile(fileURl, destination: path, overwrite: true, password: nil, progress: { progress in
                    print("progress: \(progress)")
                }, fileOutputHandler: { unzippedFile in
                    print("unzippedFile : \(unzippedFile)")
                    self.showAlertMessage(title: "복구가 완료되었습니다")
                })

            } catch {
                showAlertMessage(title: "압축 해제에 실패했습니다")
            }
        }
        
    }
}
