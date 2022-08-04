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
    let hud = JGProgressHUD()
    var movieData: [MovieModel] = []
    var castData: [CastModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.rowHeight = view.frame.height / 3
        
        mainTableView.register(UINib(nibName: TMDBTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TMDBTableViewCell.reuseIdentifier)
        fetchmovieData()
        
        
    }
    
    
    
    func configureCell(cell: TMDBTableViewCell, item: Int) {
    
        cell.posterView.kf.setImage(with: movieData[item].imageURL)
        cell.posterView.contentMode = .scaleAspectFill
        
        //등장인물 3명씩 표현
        cell.castLabel.text = castData[item * 10].cast + ", " + castData[item * 10 + 1].cast + ", " + castData[item * 10 + 2].cast
        cell.castLabel.font = .systemFont(ofSize: 14)
        cell.castLabel.textColor = .lightGray
        cell.castLabel.numberOfLines = 0
        
        cell.titleLabel.text = movieData[item].title
        cell.titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.darkGray.cgColor
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return movieData.count
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
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController {
    
    // 장르 + 제목 + 줄거리 + 이미지 URL + 백그라운드 이미지 URL
    func fetchmovieData() {
        let url = EndPoint.TMDB_URL + APIKey.TMDB_Key
        
        AF.request(url, method: .get).validate(statusCode: 200...500).responseData { response in
            self.hud.show(in: self.view, animated: true)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                // 배열 만들어서 리팩토링 다시 해보자
                for item in json["results"].arrayValue {
                    
                    // 제목 + 줄거리 + 이미지 URL + 백그라운드 이미지 URL
                    guard let imageURL = URL(string: EndPoint.posterW500_URL + item["poster_path"].stringValue) else { return }
                    guard let backDropPathURL = URL(string: EndPoint.posterW1066_URL + item["backdrop_path"].stringValue) else { return }
                    let title = item["title"].stringValue
                    let overView = item["overview"].stringValue
                    let genreID = item["genre_ids"][0].intValue
                    let movieID = item["id"].intValue
 
                    // 캐스트
                    let creditURL = "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=" + APIKey.TMDB_Key
                    AF.request(creditURL, method: .get).validate().responseData { response in
                        switch response.result {
                        case .success(let data):
                            let json = JSON(data)
                            
                            // 등장인물은 10명씩 받아오자
                            for index in 0...9 {
                                guard let profileImageURL = URL(string: EndPoint.posterW500_URL + json["cast"][index]["profile_path"].stringValue) else { return }
                                let cast = json["cast"][index]["name"].stringValue
                                let charactar = json["cast"][index]["character"].stringValue
                                self.castData.append(CastModel(cast: cast, charactar: charactar, profileImageURL: profileImageURL))
                            }
                            self.mainTableView.reloadData()
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                    // 장르
                    let genreURL = EndPoint.genres_URL + APIKey.TMDB_Key
                    AF.request(genreURL, method: .get).validate().responseData { response in
                        switch response.result {
                        case .success(let data):
                            let json = JSON(data)
                            
                            for genreData in json["genres"].arrayValue {
                                if genreData["id"].intValue == genreID {
                                    self.movieData.append(MovieModel(imageURL: imageURL, backDropPathURL: backDropPathURL, title: title, overView: overView, genre: genreData["name"].stringValue))
                                }
                            }
                            self.mainTableView.reloadData()
                        case .failure(let error):
                            print(error)
                        }
                    }
                    
                }
                self.hud.dismiss(animated: true)
            case .failure(let error):
                print(error)
                self.hud.dismiss()
            }
        }
    }
}

