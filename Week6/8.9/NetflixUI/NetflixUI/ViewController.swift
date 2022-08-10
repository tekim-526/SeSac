//
//  ViewController.swift
//  NetflixUI
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit

import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    var movieModel: [MovieModel] = []
    let category = ["# All", "# Movie", "# TV"]
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        TMDBAPIManager.shared.fetchMovieData(trending: "all") { value in
            self.movieModel.append(value)
            TMDBAPIManager.shared.fetchMovieData(trending: "movie") { value in
                self.movieModel.append(value)
                TMDBAPIManager.shared.fetchMovieData(trending: "tv") { value in
                    self.movieModel.append(value)
                    self.mainTableView.reloadData()
                }
            }
        }
        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print()
        return movieModel == [] ? 0 : movieModel[collectionView.tag].imageURL.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        
        if movieModel != [] {
            cell.contentsView.posterImageView.kf.setImage(with: movieModel[collectionView.tag].imageURL[indexPath.item])
            
        } else {
            cell.contentsView.posterImageView.image = nil
        }
        
        cell.contentsView.posterImageView.layer.cornerRadius = 10
        cell.contentsView.checkLabel.text = ""
    
        return cell
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return movieModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as? ContentTableViewCell else { return UITableViewCell() }
        
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        cell.contentCollectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContentCollectionViewCell")
        cell.categoryLabel.text = category[indexPath.item]
        cell.contentCollectionView.tag = indexPath.row
        
        cell.contentCollectionView.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        180
    }
    
}

