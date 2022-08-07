//
//  MovieDetailViewController.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/04.
//

import UIKit
import Kingfisher
import SwiftUI

class MovieDetailViewController: UIViewController {
    var movieData: MovieModel!
    var castData: [CastModel]!
    var section: Int!
    
    @IBOutlet weak var overViewView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var backDropPathImageView: UIImageView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var castTableView: UITableView!
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var overViewbutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        castTableView.register(UINib(nibName: "CastTableViewCell", bundle: nil), forCellReuseIdentifier: "CastTableViewCell")
        castTableView.delegate = self
        castTableView.dataSource = self
        navigationController?.isNavigationBarHidden = false
        castTableView.rowHeight = castTableView.frame.height / 4
        
        configureUI()
    }
    
    @IBAction func overViewButtonTapped(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
        vc.modalPresentationStyle = .formSheet
        vc.titleText = movieData.title[section]
        vc.overviewText = movieData.overView[section]
        present(vc, animated: true)
    }
    func configureUI() {
        
        titleLabel.text = movieData.title[section]
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .white
        
        overViewLabel.numberOfLines = 2
        overViewLabel.text = movieData.overView[section]
        
        overViewbutton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        overViewbutton.tintColor = .black
        
        posterImageView.kf.setImage(with: movieData.imageURL[section])
        backDropPathImageView.contentMode = .scaleAspectFill
        backDropPathImageView.kf.setImage(with: movieData.backDropPathURL[section])
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //cell xib로
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CastTableViewCell.reuseIdentifier, for: indexPath) as? CastTableViewCell else { return UITableViewCell() }
        cell.castImageView.kf.setImage(with: castData[indexPath.row].profileImageURL)
        
        cell.castLabel.text = castData[indexPath.row + section * 10].cast
        cell.characterLabel.text = castData[indexPath.row + section * 10].charactar
        cell.characterLabel.textColor = .lightGray
        return cell
    }
    
}
