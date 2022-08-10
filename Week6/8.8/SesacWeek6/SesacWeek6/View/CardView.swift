//
//  CardView.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit
/*
 Xml Interface Builder
 
 방법 1: UIView Custom Class
 방법 2: 파일 오너 설정 => 자유도 높고 확장성 더 큼
 
 */
/*
 
 View:
 - 인터페이스 빌더 UI 초기화 구문 : required init?
    - 프로토콜 초기화 구문 : required > 초기화 구문이 프로토콜로 명ㅇ세되어 있음
 - 코드 UI 초기화 구문 : override init
 
 */

class CardView: UIView {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var posterImageView: UIImageView!
    
  
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let view = UINib(nibName: "CardView", bundle: nil).instantiate(withOwner: self).first as! UIView
        view.frame = bounds
        view.backgroundColor = .clear
        self.addSubview(view)
        print(view.translatesAutoresizingMaskIntoConstraints)
    }
}
