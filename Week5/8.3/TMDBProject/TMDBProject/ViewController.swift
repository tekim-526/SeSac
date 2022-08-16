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
import JGProgressHUD



class ViewController: UIViewController {
    
    @IBOutlet weak var mainTableView: UITableView!
    
    private var movieData: MovieModel = MovieModel(movieID: [], imageURL: [], backDropPathURL: [], title: [], overView: [], genre: [])
    private var castData: [CastModel] = []
    private var trailerData: [TrailerModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.rowHeight = UIScreen.main.bounds.height / 2.5
        mainTableView.register(UINib(nibName: TMDBTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TMDBTableViewCell.reuseIdentifier)
        
        navigationItem.hidesBackButton = true
        fillMovieModelData()
        
    }
    
    private func configureCell(cell: TMDBTableViewCell, item: Int) {
        cell.navigation = navigationController
        cell.trailerURL = trailerData[item].trailerLink
        

        // 상단만 cornerRadius 주는법
        let bezierPath = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 5, height: 5))
        let maskLayer = CAShapeLayer()
        maskLayer.path = bezierPath.cgPath
        
        cell.posterView.layer.mask = maskLayer
        cell.posterView.kf.setImage(with: movieData.imageURL[item])
        cell.posterView.contentMode = .scaleAspectFill
                
        
        cell.genreLabel.text = "# " + (GenreDictionary.genreDictionary[movieData.genre[item]] ?? "Undefined Genre")
        cell.genreLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        
        cell.castLabel.text = castData[item * 10].cast + ", " + castData[item * 10 + 1].cast + ", " + castData[item * 10 + 2].cast
        cell.castLabel.font = .systemFont(ofSize: 14)
        cell.castLabel.textColor = .lightGray
        cell.castLabel.numberOfLines = 0

        cell.titleLabel.text = movieData.title[item]
        cell.titleLabel.font = .systemFont(ofSize: 16, weight: .bold)

        cell.youtubeLinkButton.backgroundColor = .white
        cell.youtubeLinkButton.layer.cornerRadius = cell.youtubeLinkButton.frame.height / 2
    }
    
    @IBAction func barTheaterButtonTapped(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Theater", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "TheaterViewController") as? TheaterViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieData.title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TMDBTableViewCell.reuseIdentifier, for: indexPath) as? TMDBTableViewCell else { return UITableViewCell() }
        configureCell(cell: cell, item: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController else { return }
        
        vc.castData = castData
        vc.movieData = movieData
        vc.section = indexPath.section
       
        present(vc, animated: true)

    }
    
}

extension ViewController {
    
    private func fillMovieModelData() {
        TMDBAPINetworkManager.shared.fetchMovie { movieData in
            self.movieData = movieData
            
            for index in 0...movieData.movieID.count - 1 {
                self.fetchCast(movieID: movieData.movieID[index])
                self.fetchTrailer(movieID: movieData.movieID[index])
                
            }
        }
    }
    
    
    private func fetchTrailer(movieID: Int) {
        TMDBAPINetworkManager.shared.fetchTrailer(movieID: movieID) { trailerData in
            self.trailerData = trailerData
            if self.movieData.movieID.count == self.trailerData.count  {
                print("self.trailerData.count == \(self.trailerData.count)", "탈출")
                self.mainTableView.reloadData()
            }
        }
    }
    
    private func fetchCast(movieID: Int) {
        TMDBAPINetworkManager.shared.fetchCast(movieID: movieID) { castData in
            self.castData = castData
            if self.movieData.movieID.count == self.castData.count  {
                print("self.castData.count == \(self.castData.count)", "탈출")
                //reloadData 마지막에 한번만 호출해도 된다
                self.mainTableView.reloadData()
            
            }
            
        }
    }
    
}
