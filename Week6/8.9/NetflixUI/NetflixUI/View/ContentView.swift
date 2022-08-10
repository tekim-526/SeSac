//
//  ContentView.swift
//  NetflixUI
//
//  Created by Kim TaeSoo on 2022/08/09.
//

import UIKit

class ContentView: UIView {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var checkLabel: UILabel!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        guard let view = UINib(nibName: "ContentView", bundle: nil).instantiate(withOwner: self).first as? UIView else { return }
        view.frame = bounds
        
        self.addSubview(view)
    }

}
