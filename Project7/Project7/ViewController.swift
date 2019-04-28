//
//  ViewController.swift
//  Project7
//
//  Created by Nick on 2019/4/28.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "https://www.hackingwithswift.com/samples/petitions-1.json"
        if let url = URL(string: url) {
            if let data = try? Data(contentsOf: url) {
                //
                parseData(json: data)
            }
        }
    }
    
    func parseData(json: Data) {
        let jsonDecoder = JSONDecoder()
        if let petition = try? jsonDecoder.decode(Petitions.self, from: json) {
            petitions = petition.results
            tableView.reloadData()
        }
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.petition = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}
