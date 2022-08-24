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

    let localRealm = try! Realm()
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
        
        tasks = localRealm.objects(ShoppingListTable.self)

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
        var task: ShoppingListTable
        if let text = shoppingListView.searchBar.text {
            task = ShoppingListTable(tableString: text)
            try! localRealm.write{
                localRealm.add(task)
            }
            shoppingListView.tableView.reloadData()
        }
    }
    
}

extension ShoppingListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppinListTableViewCell") as? ShoppinListTableViewCell else { return UITableViewCell() }
        let finishedImage = localRealm.objects(ShoppingListTable.self)[indexPath.row].isFinished ? UIImage(systemName: "checkmark.square.fill") : UIImage(systemName: "checkmark.square")
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
            try! self.localRealm.write {
                self.localRealm.delete(self.tasks[indexPath.row])
            }
            self.removeImageFromDocument(fileName: "\(self.tasks[indexPath.row].objectId).jpg")
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
        try! localRealm.write {
            self.tasks[sender.tag].isFinished.toggle()
        }
        
        shoppingListView.tableView.reloadRows(at: [[0, sender.tag]], with: .none)
    }
    @objc func isFavoriteButtonTapped(_ sender: UIButton) {
        try! localRealm.write {
            self.tasks[sender.tag].isFavorite.toggle()
        }
        shoppingListView.tableView.reloadRows(at:[[0, sender.tag]], with: .none)
    }
    
}
