//
//  CalendarView.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/27.
//

import UIKit

import FSCalendar
import SnapKit

class CalendarView: BaseView {
    
    let calendar: FSCalendar = {
        let view = FSCalendar()
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
        [calendar, tableView].forEach { self.addSubview($0) }
    }
    override func makeConstraints() {
        calendar.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(0)
            make.height.equalTo(300)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(calendar.snp.bottom)
            make.leading.trailing.equalTo(0)
            make.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
