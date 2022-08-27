//
//  CalendarViewController.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/27.
//

import UIKit
import FSCalendar
import RealmSwift

class CalendarViewController: BaseViewController, FileManagerProtocol {
    
    let userDirectory = UserDirectory()
    
    let calendarView = CalendarView()
    let formatter = DateFormatter()
    
    var tasks: Results<ShoppingListTable>! {
        didSet {
            calendarView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        view = calendarView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        formatter.dateFormat = "yyMMdd"
        
        
        tasks = userDirectory.fetchDate(date: Date())
        
        calendarView.calendar.delegate = self
        calendarView.calendar.dataSource = self
        calendarView.tableView.delegate = self
        calendarView.tableView.dataSource = self
        calendarView.tableView.register(ShoppinListTableViewCell.self, forCellReuseIdentifier: "ShoppinListTableViewCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        calendarView.tableView.reloadData()
    }
    
    
    
}

extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 116
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
    
    @objc func isFinishedButtonTapped(_ sender: UIButton) {
        userDirectory.updateFinished(item: self.tasks[sender.tag])
        calendarView.tableView.reloadRows(at: [[0, sender.tag]], with: .none)
    }
    @objc func isFavoriteButtonTapped(_ sender: UIButton) {
        userDirectory.updateFavorite(item: self.tasks[sender.tag])
        calendarView.tableView.reloadRows(at:[[0, sender.tag]], with: .none)
    }

}

extension CalendarViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return userDirectory.fetchDate(date: date).count
    }
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        tasks = userDirectory.fetchDate(date: date)
        calendarView.tableView.reloadData()
        
    }
    
}
