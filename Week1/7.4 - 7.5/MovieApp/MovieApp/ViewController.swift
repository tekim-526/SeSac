//
//  ViewController.swift
//  MovieApp
//
//  Created by Kim TaeSoo on 2022/07/04.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var posterList: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }
    
    func makeUI() {
        // MARK: - before refactor
        /*
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
        */
        // MARK: - 리팩토링 방법 1
        var _ = posterList.map { poster in
            poster.map { poster in
                poster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
                if poster.frame.width == 100 {
                    poster.layer.cornerRadius = 50
                    poster.layer.borderWidth = 2
                    poster.layer.borderColor = .init(gray: 0.5, alpha: 1)
                }
            }
        }
        
        // MARK: - 리팩토링 방법 2
        /*
        for poster in posterList {
            poster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
            if poster.frame.width == 100 {
                poster.layer.cornerRadius = 50
                poster.layer.borderWidth = 2
                poster.layer.borderColor = .init(gray: 0.5, alpha: 1)
            }
        }
        */
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        // MARK: - before refactor
        /*
        mainPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        frozenPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        extremePoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        avatarPoster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        */
        // MARK: - 리팩토링 방법 1
        var _ = posterList.map { poster in
            poster.map { poster in
                poster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
            }
        }
        // MARK: - 리팩토링 방법 2
        /*
        for poster in posterList {
            poster.image = UIImage(named: "movie\(Int.random(in: 1...20))")
        }
        */
    }
}

