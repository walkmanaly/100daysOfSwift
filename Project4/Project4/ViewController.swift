//
//  ViewController.swift
//  Project4
//
//  Created by Nick on 2019/4/19.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var progressView: UIProgressView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openClicked))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let reload = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        progressView = UIProgressView(progressViewStyle: .default)
        let progressBar = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressBar, spacer, reload]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openClicked() {
        let ac = UIAlertController(title: "Website", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: chooseWebsite))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: chooseWebsite))
        ac.addAction(UIAlertAction(title: "cancal", style: .cancel, handler: nil))
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func chooseWebsite(action: UIAlertAction) {
        guard let actionTitle = action.title else {
            return
        }
        guard let url = URL(string: "https://" + actionTitle) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    deinit {
        removeObserver(self, forKeyPath: "estimatedProgress")
    }
}

