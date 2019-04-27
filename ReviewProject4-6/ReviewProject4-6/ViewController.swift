//
//  ViewController.swift
//  ReviewProject4-6
//
//  Created by Nick on 2019/4/27.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addShoppingItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(sharedClicked))
    }
    
    @objc func addShoppingItem() {
        let av = UIAlertController(title: "Shopping Items", message: "please add your items", preferredStyle: .alert)
        av.addTextField()
        av.addAction(UIAlertAction(title: "Completed", style: .default, handler: { [weak self, weak av] (action) in            if let item = av?.textFields?[0].text {
                self?.shoppingList.insert(item, at: 0)
                let index = IndexPath(row: 0, section: 0)
                self?.tableView.insertRows(at: [index], with: .automatic)
            }
            
        }))
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(av, animated: true)
    }
    
    @objc func sharedClicked() {
        let list = shoppingList.joined(separator: "\n")
        print("list = \(list)")
        let at = UIActivityViewController(activityItems: [list], applicationActivities: [])
        present(at, animated: true)
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCell(withIdentifier: "item", for: indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
}

