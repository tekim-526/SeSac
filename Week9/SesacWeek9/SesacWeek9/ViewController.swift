//
//  ViewController.swift
//  SesacWeek9
//
//  Created by Kim TaeSoo on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lottoLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private var viewModel = TMDBPersonViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = User("tekim")
        user.bind { value in
            print("value changed to \(value)")
        }
        user.value = "kim"
        user.value = "takim"
        
        let sample = User(10.0)
        sample.bind { value in
            print("value changed to \(value)")
        }
        sample.value = 1.1 + 0.2
        
        /* LottoAPIManager.requestLotto(drwno: 1030) { lotto, error in
            guard let lotto else { return }
            self.lottoLabel.text = lotto.drwNoDate
        } */
        viewModel.fetchPerson(query: "kim")
        viewModel.list.bind { person in
            print("viewController bind")
            
            self.tableView.reloadData()
        }
    }
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.knownForDepartment
        
        return cell
    }
    
    
}
