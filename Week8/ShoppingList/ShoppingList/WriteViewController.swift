//
//  WriteViewController.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/24.
//

import UIKit
import RealmSwift
import Kingfisher

class WriteViewController: BaseViewController {
    let localRealm = try! Realm()
    var tasks: Results<ShoppingListTable>!
    
    let writeView = WriteView()
    
    var indexPath: IndexPath!
    
    var image: UIImage?
    var urls: [URL]?
    override func loadView() {
        view = writeView
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tasks = localRealm.objects(ShoppingListTable.self)
        
        writeView.collectionView.delegate = self
        writeView.collectionView.dataSource = self
        writeView.collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        configureUI()
    }
    override func configureUI() {
        writeView.titleLabel.text = tasks?[indexPath.row].tableString
        writeView.saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    @objc func saveButtonTapped() {
        saveImageToDocument(fileName: "\(tasks[indexPath.row].objectId).jpg", image: image)
        dismiss(animated: true)
    }
}

extension WriteViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = urls?.count, count <= 10 {
            return count
        } else if let count = urls?.count, count > 10 {
            return 10
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as? ImageCollectionViewCell else { return UICollectionViewCell() }
        
        if urls?.count ?? 0 > indexPath.row {
            cell.resultImageView.kf.setImage(with: urls![indexPath.row])
        }
        
        image = cell.resultImageView.image
        collectionView.reloadData()
        return cell
    }
    
    
}
