//
//  ViewController.swift
//  Project4
//
//  Created by Nick on 2019/4/19.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var progressView: UIProgressView!
//    var webSites = ["www.apple.com",
//                    "www.hackingwithswift.com",
//                    "haha#%**&^%$"]
    var webSite: String?
    
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
        
        let goBackBar = UIBarButtonItem(title: "goBack", style: .plain, target: self, action: #selector(goBack))
        let goForwardBar = UIBarButtonItem(title: "goForward", style: .plain, target: self, action: #selector(goForward))
        
        toolbarItems = [progressBar, spacer, goBackBar, spacer, goForwardBar, spacer, reload]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        if let webSite = webSite {
            if let url = URL(string: "https://" + webSite) {
                webView.load(URLRequest(url: url))
            }
        }
        
        webView.allowsBackForwardNavigationGestures = true
    }
    
    @objc func openClicked() {
        let ac = UIAlertController(title: "Website", message: nil, preferredStyle: .actionSheet)
//        for webSite in webSites {
            ac.addAction(UIAlertAction(title: webSite, style: .default, handler: chooseWebsite))
//        }
        ac.addAction(UIAlertAction(title: "cancal", style: .cancel, handler: nil))
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func chooseWebsite(action: UIAlertAction) {
        guard let actionTitle = action.title else {
            return
        }
        guard let url = URL(string: "https://" + actionTitle) else {
            
            let av = UIAlertController(title: "Oops", message: "It's blocked!", preferredStyle: .alert)
            av.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(av, animated: true)
            
            return
        }
        webView.load(URLRequest(url: url))
    }
    
    @objc func goBack() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @objc func goForward() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        if let host = url?.host {
//            for webSite in webSites {
            if let webSite = webSite {                
                if host.contains(webSite) {
                    decisionHandler(.allow)
                    return
                }
            }
//            }
        }
        decisionHandler(.allow)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    deinit {
        removeObserver(self, forKeyPath: "WKWebView.estimatedProgress")
    }
}

