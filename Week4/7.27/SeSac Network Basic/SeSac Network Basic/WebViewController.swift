//
//  WebViewController.swift
//  SeSac Network Basic
//
//  Created by Kim TaeSoo on 2022/07/28.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var xButton: UIBarButtonItem!
    @IBOutlet weak var goBackButton: UIBarButtonItem!
    @IBOutlet weak var reloadButton: UIBarButtonItem!
    @IBOutlet weak var goForwardButton: UIBarButtonItem!
    
    var destinationURL = "https://www.apple.com"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openWebPage(url: destinationURL)
        configureUI()
        searchBar.delegate = self
    }
    

    func openWebPage(url: String) {
        guard let url = URL(string: url) else {
            print("InvalidURL")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func configureUI() {
        xButton.image = UIImage(systemName: "xmark")
        goBackButton.image = UIImage(systemName: "arrow.backward")
        reloadButton.image = UIImage(systemName: "arrow.clockwise")
        goForwardButton.image = UIImage(systemName: "arrow.forward")
    }
    @IBAction func goBackButtonTapped(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func reloadButtonTapped(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    @IBAction func goForwardButtonTapped(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
}
extension WebViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        openWebPage(url: searchBar.text!)
    }
}
