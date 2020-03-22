//
//  HeroViewController.swift
//  MarvelSuperHeroes
//
//  Created by Danilo Requena on 14/03/20.
//  Copyright © 2020 Danilo Requena. All rights reserved.
//

import UIKit
import WebKit

class HeroViewController: ViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var hero: Hero!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
    
    func loadWebView() {
        let index = hero.urls[1].url
        let url = URL(string: index)
        let request = URLRequest(url: url!)
        title = hero.name
        
        webView.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        webView.load(request)
    }
    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension HeroViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loading.stopAnimating()
    }
}
