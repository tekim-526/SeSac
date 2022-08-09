//
//  SeSACButton.swift
//  SesacWeek6
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit


// 스토리보드에 보여줌 컴파일 시점에 실시간으로 객체속성 사용 가능
@IBDesignable class SeSACButton: UIButton {

    @IBInspectable // 인터페이스 빌더 인스텍터 영역에 보여줌
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    @IBInspectable var borderColor: UIColor {
        get { return UIColor(cgColor: layer.borderColor!) }
        set { layer.borderColor = newValue.cgColor }
    }
}
