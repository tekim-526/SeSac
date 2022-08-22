//
//  BaseView.swift
//  ShoppingList
//
//  Created by Kim TaeSoo on 2022/08/22.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        makeConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("fatal Error")
    }
    func configureUI() {}
    func makeConstraints() {}
}
