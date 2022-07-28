//
//  ViewPresentableProtocol.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/28.
//

import Foundation
import UIKit

// 선택적 구현 @objc optional
// 프로토콜 프로퍼티: 연산프로퍼티로 쓰던 저장프로퍼티로 쓰든 상관하지 않는다.
// 명세하지 않기에 둘다 사용가능
// 만약 get만 명시했다면, get 기능만 최소한 구현되어 있으면 된다. set구현은 선택적, get set 둘다 명시했으면 둘다 해야함

@objc
protocol ViewPresentableProtocol {
    
    var navTitleString: String { get set }
    var backgroundColor: UIColor { get }
    
    func configureView()
    @objc optional func configureLabel()
    @objc optional func configureTextField()
}


protocol KimTableViewProtocol {
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
}


