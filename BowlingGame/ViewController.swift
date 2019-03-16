//
//  ViewController.swift
//  BowlingGame
//
//  Created by 2019_DEV_139 on 16/03/2019.
//  Copyright © 2019 2019_DEV_139. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var labelScore: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        self.calculateAndDisplayScores()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
        
        self.textField.text = GameStrings.saves
    }
}

extension ViewController {
    @IBAction func buttonPerfectGameTapped() {
        self.setGameString(GameStrings.perfect)
    }
    
    @IBAction func buttonAllNinesTapped() {
        self.setGameString(GameStrings.nines)
    }
    
    @IBAction func buttonAllSavesTapped() {
        self.setGameString(GameStrings.saves)
    }
    
    func setGameString(_ string: String) {
        self.textField.text = string
        self.calculateAndDisplayScores()
    }
    
    @IBAction func buttonCalculateTapped() {
        self.calculateAndDisplayScores()
    }
    
    func calculateAndDisplayScores() {
        guard let gameText = self.textField.text else {
            self.labelScore.text = "-"
            return
        }
        
        let score = SimpleCalculator.calculateScore(from: gameText)
        let scoreText = "\(score)"

        self.labelScore.text = scoreText
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        self.textField.resignFirstResponder()
    }
}

