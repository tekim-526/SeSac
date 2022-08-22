//
//  ViewController.swift
//  TodayBoxOffice
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let localRealm = try! Realm()
    let movieAPIManager = MovieAPIManager()
    var tasks: Results<MovieTable>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let date = formatter.string(from: Date(timeIntervalSinceNow: -60 * 60 * 24))
        
        tasks = localRealm.objects(MovieTable.self)
        
        if tasks?.first?.showRange ?? "" != "\(date)~\(date)" {
            movieAPIManager.fetchDailyBoxOfficeCount(date: date) { count in
                self.movieAPIManager.fetchBoxOffice(date: date, boxOfficeCount: count, localRealm: self.localRealm) { results in
                    self.tasks = results
                }
            }
        }
    }


}

