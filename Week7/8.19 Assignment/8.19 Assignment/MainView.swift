//
//  MainView.swift
//  8.19 Assignment
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit
import SnapKit

class MainView: BaseView {
    let logoLabel: UILabel = {
        let view = UILabel()
        view.text = "N"
        view.textColor = .red
        view.font = .systemFont(ofSize: 36, weight: .heavy)
        return view
    }()
    let mainPosterImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "어벤져스엔드게임")
        view.contentMode = .scaleToFill
        return view
    }()
    let playButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(named: "play_normal"), for: .normal)
        return view
    }()
    let frozenImageView: RoundedImageView = {
        let view = RoundedImageView(image: UIImage(named: "겨울왕국2"))
        
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func configureUI() {
        [mainPosterImageView, logoLabel, playButton, frozenImageView].forEach { self.addSubview($0) }
    }
    override func makeConstraints() {
        logoLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.leading.equalTo(20)
        }
        mainPosterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(0)
            make.height.equalTo(self.snp.height).multipliedBy(0.75)
        }
        playButton.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(mainPosterImageView.snp.bottom).inset(48)
        }
        frozenImageView.snp.makeConstraints { make in
            make.top.equalTo(mainPosterImageView.snp.bottom).offset(32)
            make.centerX.equalTo(self.snp.centerX)
            make.height.width.equalTo(100)
        }
    }
}
