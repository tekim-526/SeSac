//
//  BaseView.swift
//  SeSACWeek7Diary
//
//  Created by Kim TaeSoo on 2022/08/19.
//

import UIKit

class BaseView: UIView {
    
    // 코드베이스 일때 호출
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    // xib, storyboard 기반일때 호출 protocol로 구성되어 있기 때문에 required 필수적
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    
    func setConstraints() {  }
    
}
