//
//  ImageSearchViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON


class ImageSearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var searchImageCollectionView: UICollectionView!
    
    var imageURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fetechImage()
        searchImageCollectionView.delegate = self
        searchImageCollectionView.dataSource = self
        
    }
    func fetechImage() {
        let text = "과자".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = EndPoint.imageSearchURL + "query=\(text!)&display=30&start=1"
        
        let header: HTTPHeaders = ["X-Naver-Client-Id" : APIKey.NAVER_CID, "X-Naver-Client-Secret" : APIKey.NAVER_CSECRET]
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let error):
                print(error)
                
            }
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageSearchCollectionViewCell", for: indexPath) as? ImageSearchCollectionViewCell else { return UICollectionViewCell() }
        cell.searchImageView.image = UIImage(systemName: "xmark")
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    


}
