//
//  YoutubeWebViewController.swift
//  TMDBProject
//
//  Created by Kim TaeSoo on 2022/08/07.
//

import UIKit
import WebKit


class YoutubeWebViewController: UIViewController {

    @IBOutlet weak var trailerWebView: WKWebView!
    var trailerURL: URL!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        openTrailer(url: trailerURL)
    }
    func openTrailer(url: URL) {
        let request = URLRequest(url: url)
        trailerWebView.load(request)
    }

}
