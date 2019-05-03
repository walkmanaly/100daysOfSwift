//
//  ViewController.swift
//  Project8
//
//  Created by Nick on 2019/5/1.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var level = 1
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    var scoreLabel: UILabel!
    var cluesLabel: UILabel!
    var resultLabel: UILabel!
    var textField: UITextField!
    var submitButton: UIButton!
    var resetButton: UIButton!
    var buttons = [UIButton]()
    
    var tips = ""
    var questions = ""
    var bits = [String]()
    var solutions = [String]()
    var activitedButton = [UIButton]()
    
    override func loadView() {
        let backView = UIView()
        backView.backgroundColor = .white
        view = backView
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = UIFont.systemFont(ofSize: 12)
        scoreLabel.textAlignment = .right
        scoreLabel.text = "score: 0"
        
        cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 24)
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        cluesLabel.textAlignment = .left
        cluesLabel.numberOfLines = 0
        cluesLabel.text = "clues"
        
        resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = UIFont.systemFont(ofSize: 24)
        resultLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        resultLabel.numberOfLines = 0
        resultLabel.textAlignment = .right
        resultLabel.text = "result"
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        textField.placeholder = "Please input the answer"
        textField.font = UIFont.systemFont(ofSize: 56)
        
        submitButton = UIButton(type: .system)
        submitButton.setTitle("submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        
        resetButton = UIButton(type: .system)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("reset", for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        
        let buttonsView = UIView()
        buttonsView.layer.borderWidth = 1
        buttonsView.layer.borderColor = UIColor.lightGray.cgColor
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonWidth: Int = 150
        let buttonHeight: Int = 80
        for i in 0...4 {
            for j in 0...3 {
                let button = UIButton(type: .system)
                button.setTitle("HHH", for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 36)
                let frame = CGRect(x: i * buttonWidth, y: j * buttonHeight, width: buttonWidth, height: buttonHeight)
                button.frame = frame
                button.addTarget(self, action: #selector(letterTapped), for: .touchUpInside)
                buttonsView.addSubview(button)
                buttons.append(button)
            }
        }
        
        view.addSubviews(views: scoreLabel, cluesLabel, resultLabel, textField, submitButton, resetButton, buttonsView)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: -100),
            
            resultLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            resultLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: -100),
            resultLabel.heightAnchor.constraint(equalTo: cluesLabel.heightAnchor),
            
            textField.topAnchor.constraint(equalTo: cluesLabel.bottomAnchor),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            submitButton.topAnchor.constraint(equalTo: textField.bottomAnchor),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            submitButton.widthAnchor.constraint(equalToConstant: 100),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            
            resetButton.topAnchor.constraint(equalTo: textField.bottomAnchor),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            resetButton.widthAnchor.constraint(equalToConstant: 100),
            resetButton.heightAnchor.constraint(equalToConstant: 44),
            
            buttonsView.topAnchor.constraint(equalTo: submitButton.bottomAnchor),
            buttonsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonsView.widthAnchor.constraint(equalToConstant: 750),
            buttonsView.heightAnchor.constraint(equalToConstant: 320),
            buttonsView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -20)
            
            ])
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadLevel()
        
    }
    
    @objc func letterTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle else {
            return
        }
        textField.text = textField.text?.appending(title)
        
        sender.isHidden = true
        activitedButton.append(sender)
        
    }
    
    @objc func submitTapped(_ sender: UIButton) {
        guard let answer = textField.text else {
            return
        }
        
        if let solution = solutions.firstIndex(of: answer) {
            activitedButton.removeAll()
            
            var splitAnswers = resultLabel.text?.components(separatedBy: "\n")
            splitAnswers?[solution] = answer
            resultLabel.text = splitAnswers?.joined(separator: "\n")
            
            textField.text = ""
            score += 1
            
            if score % 7 == 0 {
                let ac = UIAlertController(title: "Well Done", message: "go to next level", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Yes", style: .default, handler: nextLevel))
                present(ac, animated: true)
            }
        }
    }
    
    @objc func nextLevel(_ ac: UIAlertAction) {
        level += 1
        loadLevel()
        
        solutions.removeAll(keepingCapacity: true)
        for button in buttons {
            button.isHidden = false
        }
    }
    
    @objc func resetTapped(_ sender: UIButton) {
        for button in activitedButton {
            button.isHidden = false
        }
        textField.text = ""
        activitedButton.removeAll()
    }

    func loadLevel() {
        
        if let levelFileUrl = Bundle.main.url(forResource: "level\(level)", withExtension: "txt") {
            if let levelString = try? String(contentsOf: levelFileUrl) {
                
                var lines = levelString.components(separatedBy: "\n")
                lines.shuffle()
                
                for (index, line) in lines.enumerated() {
                    let letters = line.components(separatedBy: ": ")
                    
                    let wordsString = letters[0]
                    let question = letters[1]
                    
                    questions += ("\(index + 1). \(question)\n")
                    
                    let words = wordsString.components(separatedBy: "|")
                    var solution = ""
                    for word in words {
                        bits.append(word)
                        solution += word
                    }
                    solutions.append(solution)
                    tips += "\(words.count) letters\n"
                }
                
                cluesLabel.text = questions.trimmingCharacters(in: .whitespacesAndNewlines)
                resultLabel.text = tips.trimmingCharacters(in: .whitespacesAndNewlines)
                
                bits.shuffle()
                if bits.count == buttons.count {
                    for i in 0..<bits.count {
                        buttons[i].setTitle(bits[i], for: .normal)
                    }
                }
            }
        }
    }

    
}

extension UIView {
    func addSubviews(views: UIView...) {
        for subView in views {
            self.addSubview(subView)
        }
    }
}
