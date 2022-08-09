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
    
    var movieModel: MovieModel = MovieModel(imageURL: [])
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self

        
    }


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentCollectionViewCell", for: indexPath) as? ContentCollectionViewCell else { return UICollectionViewCell() }
        cell.contentsView.posterImageView.image = UIImage(systemName: "xmark")
        cell.contentsView.posterImageView.layer.cornerRadius = 10
        cell.contentsView.checkLabel.text = "\(indexPath.row)"
        
        return cell
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContentTableViewCell", for: indexPath) as? ContentTableViewCell else { return UITableViewCell() }
        
        cell.contentCollectionView.delegate = self
        cell.contentCollectionView.dataSource = self
        cell.backgroundColor = .lightGray
        cell.contentCollectionView.register(UINib(nibName: "ContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ContentCollectionViewCell")
    
    
        cell.contentCollectionView.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
}

extension ViewController {
    func fetchPosterURL() {
        TMDBAPIManager.shared.fetchMovieData { movieModel in
            self.movieModel = movieModel
            self.mainTableView.reloadData()
        }
    }
}
