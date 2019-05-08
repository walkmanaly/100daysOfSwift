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
    var visitCounts = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        performSelector(inBackground: #selector(fetchData), with: nil)
        
        title = "Pictures List"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareListClicked))
    }
    
    @objc func fetchData() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                picturesStr.append(item)
                let defaults = UserDefaults.standard
                let count = defaults.integer(forKey: item)
                visitCounts.append(count)
            }
        }
        picturesStr.sort()
        print(picturesStr)
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }
    
    @objc func shareListClicked() {
        
        let vc = UIActivityViewController(activityItems: ["My project1 of hacking swift"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
        cell.detailTextLabel?.text = String(visitCounts[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "detail") as? DetailViewController {
            vc.selecedImage = picturesStr[indexPath.row]
            vc.headTitle = "Picture \(picturesStr.firstIndex(of: picturesStr[indexPath.row])! + 1) of \(picturesStr.count)"
            var counts = visitCounts[indexPath.row]
            counts += 1
            let defaults = UserDefaults.standard
            defaults.set(counts, forKey: picturesStr[indexPath.row])
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

