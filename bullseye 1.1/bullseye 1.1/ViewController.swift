//
//  ViewController.swift
//  bullseye 1.1
//
//  Created by Shubham Mittal on 29/05/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var round: UILabel!
    
    var currentValue: Int = 0
    var targetValue = 0
    var initialScore = 0
    var initialRound = 5
    var difference: Int = 0
    
    override func viewDidLoad() {

        super.viewDidLoad()
        startNewRound()
        updateLabel()
        
    }
    @IBAction func showAlert(){
        if (initialRound != 0) {
            updateScore()
            let message = "You scored \(difference) points"
            
            let alert = UIAlertController(title: "Bullseye!", message: message, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
            updateScore()
            startNewRound()
            updateLabel()
            updateRound()
        }else{
            let messageStop = "You have used your 5 rounds. Press Start Over to play again"
            
            let alertStop = UIAlertController(title: "Game Over!", message: messageStop, preferredStyle: .alert)
            
            let actionStop = UIAlertAction(title: "Okay", style: .default, handler: nil)
            
            alertStop.addAction(actionStop)
            present(alertStop, animated: true, completion: nil)

        }
        
        
    }
    @IBAction func sliderMoved(_ slider: UISlider){
        currentValue = lroundf(slider.value)
        print(currentValue)
    }
    @IBAction func Start(){
        initialRound = 5
        initialScore = 0
        round.text = String(initialRound)
        score.text = String(initialScore)
    }
    @IBAction func iButton(){
        let describe = "Move the slider to as close as the value displayed at the top and tap Hit Me"
        let description = UIAlertController(title: "Description", message: describe, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "Okay", style: .default, handler: nil)
        description.addAction(close)
        present(description, animated: true, completion: nil)
    }
    func startNewRound(){
        targetValue = Int.random(in: 0...10)
        currentValue = 5
        slider.value = Float(currentValue)
    }
    func updateLabel(){
        targetLabel.text = String(targetValue)
    }
    func updateScore(){
        
        difference = 10 - abs(currentValue - targetValue)
        initialScore += difference/2
        score.text = String(initialScore)
    }
    func updateRound(){
            initialRound -= 1
            round.text = String(initialRound)
        
        
    }
    
}
