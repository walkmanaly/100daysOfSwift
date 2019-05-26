//
//  DetailViewController.swift
//  Project16
//
//  Created by Nick on 2019/5/26.
//  Copyright © 2019 Nick. All rights reserved.
//

import WebKit
import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var capital: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var urlString = "https://zh.wikipedia.org/wiki/"
        if let capital = capital {
            urlString.append(capital)
        }
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
        
        title = webView.title

    }

}
