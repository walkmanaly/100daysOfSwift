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
    var allPetitions = [Petition]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(showMessage))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(filterData))
        
        var url: String
        if navigationController?.tabBarItem.tag == 0 {
            url = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            url = "https://www.hackingwithswift.com/samples/petitions-2.json"
        }
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: url) {
                if let data = try? Data(contentsOf: url) {
                    self?.parseData(json: data)
                    return
                }
            }
            
            self?.showError()
        }
    }
    
    @objc func filterData() {
        let ac = UIAlertController(title: "Filter", message: "Please input keyword", preferredStyle: .alert)
        ac.addTextField()
        ac.addAction(UIAlertAction(title: "Commit", style: .default, handler: { [weak ac, weak self] _ in
            if let text = ac?.textFields?[0].text {
                // get the text from the textfeild
                self?.petitions.removeAll()
                for petition in self?.allPetitions ?? [] {
                    if petition.title.contains(text) {
                        self?.petitions.append(petition)
                        self?.tableView.reloadData()
                    }
                }
            }
        }))
        present(ac, animated: true)
    }
    
    @objc func showMessage() {
        DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Tips", message: "the data comes from the We The People API of the Whitehouse.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            self?.present(ac, animated: true)
        }
    }
    
    func showError() {
        let ac = UIAlertController(title: "Error", message: "something wrong when load the data", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
//        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func parseData(json: Data) {
        let jsonDecoder = JSONDecoder()
        if let petition = try? jsonDecoder.decode(Petitions.self, from: json) {
            petitions = petition.results
            allPetitions = petitions
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
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
