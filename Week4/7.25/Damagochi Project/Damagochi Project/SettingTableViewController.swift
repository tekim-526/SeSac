//
//  SettingTableViewController.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/23.
//

import UIKit

class SettingTableViewController: UITableViewController {
    @IBOutlet weak var captainName: UILabel!
    @IBOutlet weak var renameRightDetailLabel: UILabel!
    
    var model: Model!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = model.backGroundColor
        makeNavigationUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        renameRightDetailLabel.text = UserDefaults.standard.string(forKey: "captain")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        if indexPath.row == TableViewEnum.rename.rawValue {
            guard let vc = sb.instantiateViewController(withIdentifier: "RenameViewController") as? RenameViewController else { return }
            vc.model = model
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == TableViewEnum.change.rawValue {
            guard let vc = sb.instantiateViewController(withIdentifier: "DamagochiCollectionViewController") as? DamagochiCollectionViewController else {return}
            self.navigationController?.pushViewController(vc, animated: true)
            
        } else if indexPath.row == TableViewEnum.reset.rawValue {
            let alert = UIAlertController(title: "데이터 초기화", message: "처음부터 다시 시작할까요?", preferredStyle: .alert)
            let no = UIAlertAction(title: "아니요", style: .default)
            let yes = UIAlertAction(title: "예", style: .destructive) { _ in
                UserDefaults.standard.set(false, forKey: "reset")
                self.changeSceneToCollectionView()
            }
            alert.addAction(no)
            alert.addAction(yes)
            present(alert, animated: true)
            
        }
    }
    
    @objc func popView() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func makeNavigationUI() {
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(popView))
        leftBarButton.tintColor = .black
        navigationItem.title = "설정"
        navigationItem.titleView?.tintColor = .black
        navigationItem.leftBarButtonItem = leftBarButton
    }
    
    func changeSceneToCollectionView() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DamagochiCollectionViewController")
        let nav = UINavigationController(rootViewController: vc)
    
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
