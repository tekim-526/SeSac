//
//  TrendSearchTableViewController.swift
//  TrendMedia
//
//  Created by Kim TaeSoo on 2022/07/19.
//

import UIKit

class TrendSearchTableViewController: UITableViewController {

    var movieList = MovieInfo()
    //["암살", "괴물", "해리포터와 불의 잔", "라라랜드", "탑건: 매버릭", "어벤져스", "스파이더맨", "토르", "헤어질 결심"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrendSearchTableViewCell", for: indexPath) as! TrendSearchTableViewCell
        cell.configureCell(data: movieList.movie[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 8
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt")
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        // present말고 push
        let vc = sb.instantiateViewController(withIdentifier: "RecommandCollectionViewController") as! RecommandCollectionViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }

}
