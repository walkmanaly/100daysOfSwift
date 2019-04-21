//
//  ViewController.swift
//  Project5
//
//  Created by Nick on 2019/4/21.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var allWords = [String]()
    var useWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let allWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let allWordsStr = try? String(contentsOf: allWordsURL) {
                allWords = allWordsStr.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["fail"]
        }
        
        startGame()
        
    }
    
    func startGame() {
        title = allWords.randomElement()
        useWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return useWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
        cell.textLabel?.text = useWords[indexPath.row]
        return cell
    }

}

