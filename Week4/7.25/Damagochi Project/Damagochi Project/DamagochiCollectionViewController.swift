//
//  DamagochiCollectionViewController.swift
//  Damagochi Project
//
//  Created by Kim TaeSoo on 2022/07/22.
//

import UIKit
import Toast

class DamagochiCollectionViewController: UICollectionViewController {
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = model.backGroundColor
        makeUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print(#function)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DamagochiCollectionViewCell", for: indexPath) as? DamagochiCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.damagochiImageView.backgroundColor = .clear
        cell.makeUI(row: indexPath.row)
        
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row < Damagochi.allCases.count {
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyBoard.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController else { return }
            
            viewController.modalPresentationStyle = .overCurrentContext
            viewController.row = indexPath.row
            viewController.navigation = navigationController
            viewController.motherView = view
            
            view.layer.opacity = 0.8
            
            present(viewController, animated: true)
        } else {
            self.view.makeToast("준비중이에요.", duration: 1, position: .center)
        }
    }
    
    func makeUI() {
        
        navigationItem.title = "다마고치 선택하기"
        
        let space: CGFloat = 8
        let width = UIScreen.main.bounds.width - (space * 4)
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: width / 3, height: (width / 3) * 1.2)
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space

        collectionView.collectionViewLayout = layout
    }
    
}


