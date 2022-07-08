//
//  ViewController.swift
//  MovieApp
//
//  Created by Kim TaeSoo on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainPoster: UIImageView!
    @IBOutlet weak var frozenPoster: UIImageView!
    @IBOutlet weak var extremePoster: UIImageView!
    @IBOutlet weak var avatarPoster: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        mainPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        frozenPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        extremePoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        avatarPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")

        frozenPoster.layer.cornerRadius = 50
        frozenPoster.layer.borderWidth = 2
        frozenPoster.layer.borderColor = .init(gray: 0.5, alpha: 1)
        
        avatarPoster.layer.cornerRadius = 50
        avatarPoster.layer.borderWidth = 2
        avatarPoster.layer.borderColor = .init(gray: 0.5, alpha: 1)
        
        extremePoster.layer.cornerRadius = 50
        extremePoster.layer.borderWidth = 2
        extremePoster.layer.borderColor = .init(gray: 0.5, alpha: 1)
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        mainPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        frozenPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        extremePoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        avatarPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
    }
}

