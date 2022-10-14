//
//  ShoppingListView.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import UIKit

import SnapKit

class ShoppingListView: BaseView {
    let searchBar: UISearchBar = {
        let view = UISearchBar()
        
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("fatal Error")
    }
    
    override func configureUI() {
        print(#function)
        [searchBar, tableView].forEach {
            self.addSubview($0)
        }
    }
    
    override func makeConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(0)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
