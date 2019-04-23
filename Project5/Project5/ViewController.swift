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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promotAnser))
        
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
    
    @objc func promotAnser() {
        let ac = UIAlertController(title: "Word", message: "Typing word", preferredStyle: .alert)
        ac.addTextField()
        
        let av = UIAlertAction(title: "submit", style: .default) {
            [weak self, weak ac] _ in
            if let word = ac?.textFields?[0].text {
                self?.submit(word)
            }
            
        }
        ac.addAction(av)
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }

    func submit(_ anser: String) {
        print(anser)
        
        let errorTitle: String
        let errorMessage: String
        
        let lowcaseWord = anser.lowercased()
        if isPossible(word: lowcaseWord) {
            if isOriginal(word: lowcaseWord) {
                if isReal(word: lowcaseWord) {
                    useWords.insert(lowcaseWord, at: 0)
                    let indexPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indexPath], with: .fade)
                    return
                } else {
                    errorTitle = "Word not recognised"
                    errorMessage = "You can't just make them up"
                    handleErrors(errorTitle: errorTitle, errorMessage: errorMessage)
                }
            } else {
                errorTitle = "Word used already"
                errorMessage = "Be more original!"
                handleErrors(errorTitle: errorTitle, errorMessage: errorMessage)
            }
        } else {
            guard let title = title?.lowercased() else { return }
            errorTitle = "Word not possible"
            errorMessage = "You can't spell that word from \(title)"
            handleErrors(errorTitle: errorTitle, errorMessage: errorMessage)
        }
        
    }
    
    func handleErrors(errorTitle: String, errorMessage: String) {
        let ac = UIAlertController(title: errorTitle, message: errorMessage, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
    
    func isPossible(word: String) -> Bool {
        guard var tempWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: position)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isOriginal(word: String) -> Bool {
        return !useWords.contains(word)
    }
    
    func isReal(word: String) -> Bool {
        
        if word.count < 3 {
            return false
        }
        
        if word.first == title?.first {
            return false
        }
        
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
}

