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
    var tasks: Results<ShoppingListTable>!
    
    override func loadView() {
        view = shoppingListView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = localRealm.objects(ShoppingListTable.self)
        
        shoppingListView.tableView.delegate = self
        shoppingListView.tableView.dataSource = self
        shoppingListView.tableView.allowsSelection = false
        shoppingListView.tableView.register(ShoppinListTableViewCell.self, forCellReuseIdentifier: "ShoppinListTableViewCell")
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
        cell.label.text = tasks[indexPath.row].tableString
        cell.isFinishedButton.addTarget(self, action: #selector(isFinishedButtonTapped), for: .touchUpInside)
        return cell
    }
    @objc func isFinishedButtonTapped() {
        print(1)
    }
    
}
