//
//  ViewController.swift
//  Project8
//
//  Created by Nick on 2019/5/1.
//  Copyright © 2019 Nick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func loadView() {
        let backView = UIView()
        backView.backgroundColor = .white
        view = backView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.font = UIFont.systemFont(ofSize: 12)
        scoreLabel.textAlignment = .right
        scoreLabel.text = "score: 0"
        //        view.addSubview(scoreLabel)
        
        let cluesLabel = UILabel()
        cluesLabel.translatesAutoresizingMaskIntoConstraints = false
        cluesLabel.font = UIFont.systemFont(ofSize: 44)
        cluesLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        cluesLabel.textAlignment = .right
        cluesLabel.text = "clues"
        //        view.addSubview(cluesLabel)
        
        let resultLabel = UILabel()
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.font = UIFont.systemFont(ofSize: 44)
        resultLabel.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        resultLabel.text = "result"
        
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isUserInteractionEnabled = false
        textField.placeholder = "Please input the answer"
        textField.font = UIFont.systemFont(ofSize: 56)
        
        let submitButton = UIButton(type: .system)
        submitButton.setTitle("submit", for: .normal)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        let resetButton = UIButton(type: .system)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.setTitle("reset", for: .normal)
        resetButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        
        let buttonsView = UIView()
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
                buttonsView.addSubview(button)
            }
        }
        
        view.addSubviews(views: scoreLabel, cluesLabel, resultLabel, textField, submitButton, resetButton, buttonsView)
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            cluesLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            cluesLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            cluesLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.6, constant: 0),
            
            resultLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            resultLabel.widthAnchor.constraint(equalTo: view.layoutMarginsGuide.widthAnchor, multiplier: 0.4, constant: 0),
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
        
        cluesLabel.backgroundColor = .red
        resultLabel.backgroundColor = .green
    }


}

extension UIView {
    func addSubviews(views: UIView...) {
        for subView in views {
            self.addSubview(subView)
        }
    }
}
