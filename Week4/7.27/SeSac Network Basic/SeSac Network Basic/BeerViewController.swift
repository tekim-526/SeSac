//
//  BeerViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/08/01.
//

import UIKit

import Alamofire
import SwiftyJSON
import Kingfisher

class BeerViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getBeerFromServer()
        configureUI()
    }
    
    func getBeerFromServer() {
        let url = "https://api.punkapi.com/v2/beers/random"
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseData { response in
            switch response.result {
            case .success(let data):
                let json = JSON(data)
                self.nameLabel.text = json[0]["name"].string
                if json[0]["image_url"].string != nil {
                    self.imageView.kf.setImage(with: URL(string: json[0]["image_url"].stringValue))
                } else {
                    self.imageView.image = UIImage(systemName: "xmark")
                    
                }
                self.descriptionLabel.text = json[0]["description"].string
            case .failure(let error):
                print(error)
            }
        }
    }
    func configureUI() {
        nameLabel.numberOfLines = 0
        nameLabel.font = .boldSystemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        imageView.tintColor = .black
        
    }
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        getBeerFromServer()
    }
}
