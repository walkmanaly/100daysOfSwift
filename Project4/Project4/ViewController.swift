//
//  ViewController.swift
//  Project4
//
//  Created by Nick on 2019/4/21.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let webSites = ["apple.com", "hackingwithswift.com", "google.com", "swift.org", "twitter.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return webSites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = webSites[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "webview") as? WebViewController {
            vc.webSite = webSites[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
