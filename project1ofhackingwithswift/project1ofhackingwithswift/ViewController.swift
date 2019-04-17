//
//  ViewController.swift
//  project1ofhackingwithswift
//
//  Created by Nick on 2019/4/13.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var picturesStr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                picturesStr.append(item)
            }
        }
        picturesStr.sort()
        print(picturesStr)
        
        title = "Pictures List"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return picturesStr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "picture", for: indexPath)
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30.0, weight: UIFont.Weight.bold)
        cell.textLabel?.text = picturesStr[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            vc.selecedImage = picturesStr[indexPath.row]
            vc.headTitle = "Picture \(picturesStr.firstIndex(of: picturesStr[indexPath.row])! + 1) of \(picturesStr.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

