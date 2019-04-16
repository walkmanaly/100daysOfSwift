//
//  ViewController.swift
//  Project2
//
//  Created by Nick on 2019/4/15.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var rightAnser = 0
    var total = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle() // 将数组的书序随机打乱
        rightAnser = Int.random(in: 0...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        title = countries[rightAnser].uppercased() .appending(" total score: \(score)")
        if action != nil && total < 10 {
            total += 1
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let continueAv = UIAlertAction(title: "Continue", style: .default, handler: askQuestion)
        let finishAv = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        let ac = UIAlertController(title: "Score", message: "", preferredStyle: .alert)
        if total < 10 {
            if sender.tag == rightAnser {
                score += 1
                ac.message = "Right! Your score is \(score)"
            } else {
                score -= 1
                ac.message = "Wrong! That’s the flag of \(countries[sender.tag])"
            }
            ac.addAction(continueAv)
        } else {
            ac.message = "This is the last question, your total score is \(score)"
            ac.addAction(finishAv)
        }
        present(ac, animated: true, completion: nil)
    }
}

