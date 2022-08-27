//
//  ViewController.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import UIKit

import RealmSwift

class ShoppingListViewController: BaseViewController {
    let shoppingListView = ShoppingListView()
    let userDirectory = UserDirectory()
    
    var tasks: Results<ShoppingListTable>! {
        didSet {
            shoppingListView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = shoppingListView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        tasks = userDirectory.fetch()
        
        shoppingListView.tableView.delegate = self
        shoppingListView.tableView.dataSource = self
        
        shoppingListView.tableView.register(ShoppinListTableViewCell.self, forCellReuseIdentifier: "ShoppinListTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        shoppingListView.tableView.reloadData()
    }
    override func configureUI() {
        shoppingListView.searchBar.searchTextField.addTarget(self, action: #selector(searchbarAction), for: .editingDidEndOnExit)
        
    }
    
    
    @objc func searchbarAction() {
        if let text = shoppingListView.searchBar.text {
            let task = ShoppingListTable(tableString: text)
            userDirectory.addTask(task: task)
            shoppingListView.tableView.reloadData()
        }
    }
    
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource, FileManagerProtocol {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppinListTableViewCell") as? ShoppinListTableViewCell else { return UITableViewCell() }
        let finishedImage = tasks[indexPath.row].isFinished ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
        let favoriteImage = tasks[indexPath.row].isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        
        cell.label.text = tasks[indexPath.row].tableString
        
        cell.isFinishedButton.tag = indexPath.row
        cell.isFinishedButton.setImage(finishedImage, for: .normal)
        cell.isFinishedButton.addTarget(self, action: #selector(isFinishedButtonTapped), for: .touchUpInside)

        cell.isFavoriteButton.tag = indexPath.row
        cell.isFavoriteButton.setImage(favoriteImage, for: .normal)
        cell.isFavoriteButton.addTarget(self, action: #selector(isFavoriteButtonTapped), for: .touchUpInside)
        cell.searchImage.image = loadImageFromDocument(fileName: "\(tasks[indexPath.row].objectId).jpg")
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "제거") { action, view, handler in
            self.removeImageFromDocument(fileName: "\(self.tasks[indexPath.row].objectId).jpg")
            
            self.userDirectory.deleteTask(task: self.tasks[indexPath.row])

            self.shoppingListView.tableView.reloadData()
            
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = WriteViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.indexPath = indexPath
        UnsplashAPIManager.getSearchData(query: tasks[indexPath.row].tableString!, page: 1) { urls in
            vc.urls = urls
        }
        present(vc, animated: true)
    }
    @objc func isFinishedButtonTapped(_ sender: UIButton) {
        userDirectory.updateFinished(item: self.tasks[sender.tag])
        shoppingListView.tableView.reloadRows(at: [[0, sender.tag]], with: .none)
        
    }
    @objc func isFavoriteButtonTapped(_ sender: UIButton) {
        userDirectory.updateFavorite(item: self.tasks[sender.tag])
        shoppingListView.tableView.reloadRows(at:[[0, sender.tag]], with: .none)
    }
    @objc func backupBarButtonTapped() {
        let vc = BackupViewController()

        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
