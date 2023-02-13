//
//  NewsDetailViewController.swift
//  Mandiri-Felinda-iOS
//
//  Created by Felinda Lubis on 14/02/23.
//

import UIKit
import WebKit

// MARK: - Class
class NewsDetailViewController: UIViewController, WKNavigationDelegate {
    static let identifier = "NewsDetailViewController"
    var webView: WKWebView!
    var url: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
}

// MARK: - Setups
extension NewsDetailViewController {
    private func setupSubviews() {
        setupWebView()
    }
    
    private func setupWebView() {
        let url = URL(string: url)!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
}
