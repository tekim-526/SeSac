//
//  TrendSearchTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class TrendSearchTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendSearchTableViewCell", for: indexPath) as! TrendSearchTableViewCell
        cell.titleLabel.text = "제목"
        cell.dateLabel.text = "개봉일"
        cell.descriptionLabel.text = "영화 설명"
        tableView.rowHeight = 120
        return cell
    }
    

}
