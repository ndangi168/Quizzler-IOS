//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle! //Ture or False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        //changing color according to right and wrong answer
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
       
        //updating question number
        quizBrain.nextQuestion()
        
        //Adding delay
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    @objc func updateUI(){
        //changing question after answering
        questionLabel.text = quizBrain.getQuestionText()
        
        //clearing color
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        score.text = "Score: \(quizBrain.getScore()) / \(quizBrain.quiz.count)"
        
        //Updating progress bar
        progressBar.progress = quizBrain.getProgress()
    }
    
}

