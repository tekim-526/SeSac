//
//  ViewController.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/03.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.rowHeight = view.frame.height / 3
    
        mainTableView.register(UINib(nibName: TMDBTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TMDBTableViewCell.reuseIdentifier)
//        view.backgroundColor = .red
    }

    func fetchRequest(cell: TMDBTableViewCell, row: Int) {
        let url = EndPoint.TMDB_URL + APIKey.TMDB_Key
        let parameter = ["media_type" : "all", "time_window" : "day"]
        AF.request(url, method: .get).validate(statusCode: 200...500).response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value!)
                cell.posterView.kf.setImage(with: URL(string: EndPoint.poster_URL + json["results"][row]["poster_path"].stringValue))
                cell.posterView.contentMode = .scaleAspectFill
                cell.overviewLabel.text = json["results"][row]["overview"].string
                cell.overviewLabel.font = .systemFont(ofSize: 14)
                cell.overviewLabel.textColor = .lightGray
                cell.overviewLabel.numberOfLines = 0
                
                cell.titleLabel.text = json["results"][row]["title"].string
                cell.titleLabel.font = .systemFont(ofSize: 16, weight: .bold)

                cell.layer.borderWidth = 1
                cell.layer.borderColor = UIColor.darkGray.cgColor
                print(json)
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TMDBTableViewCell.reuseIdentifier, for: indexPath) as? TMDBTableViewCell else { return UITableViewCell() }
        
        
        fetchRequest(cell: cell, row: indexPath.section)
        return cell
    }
    
    
}
