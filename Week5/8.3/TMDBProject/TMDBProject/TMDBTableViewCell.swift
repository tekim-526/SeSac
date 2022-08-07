//
//  TMDBTableViewCell.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/03.
//

import UIKit

class TMDBTableViewCell: UITableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var castLabel: UILabel!
    @IBOutlet weak var youtubeLinkButton: UIButton!
    var navigation: UINavigationController!
    var trailerURL: URL!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func youtubeLinkButtonTapped(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "YoutubeWebViewController") as? YoutubeWebViewController else { return }
        vc.trailerURL = trailerURL
        navigation.pushViewController(vc, animated: true)
        print(456)
    }
    
}

