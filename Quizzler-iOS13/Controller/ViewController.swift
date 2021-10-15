//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var ans1Button: UIButton!
    @IBOutlet weak var ans2Button: UIButton!
    @IBOutlet weak var ans3Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        sender.backgroundColor = quizBrain.checkAnswer(sender.currentTitle!)
        quizBrain.increment()
        scoreLabel.text = quizBrain.updateScore()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @objc func updateUI(){
        ans1Button.setTitle(quizBrain.getAnswerText(0), for: .normal)
        ans2Button.setTitle(quizBrain.getAnswerText(1), for: .normal)
        ans3Button.setTitle(quizBrain.getAnswerText(2), for: .normal)
        progressBar.progress = quizBrain.getProgress()
        questionLabel.text = quizBrain.getQuestionText()
        ans1Button.backgroundColor = UIColor.clear
        ans2Button.backgroundColor = UIColor.clear
        ans3Button.backgroundColor = UIColor.clear
    }

}

