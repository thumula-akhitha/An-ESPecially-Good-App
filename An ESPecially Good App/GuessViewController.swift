//
//  FirstViewController.swift
//  An ESPecially Good App
//
//  Created by student on 2/28/20.
//  Copyright © 2020 student. All rights reserved.
//

import UIKit

class GuessViewController: UIViewController {
    @IBOutlet weak var resultLBL: UILabel!
    @IBOutlet weak var scoreLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    ///action event for circle click and updates the result and score label
    @IBAction func tappedCircle(sender:Any){
        let value = Predictions.shared.check(prediction: .circle)
        //self.resultLBL.text = "?"
        
        let emojiTimer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { _ in
            if value == true {
                self.resultLBL.text = "😎"
            }
            else{
                self.resultLBL.text = "😱"
            }
            
            
        }
        let questionTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.resultLBL.text = "?"
        }
        Predictions.shared.generateQuestion()
        self.scoreLBL.text = "\(Predictions.shared.numCorrect())/\(Predictions.shared.numAttempted())"
    }
    
    /// action event for triangle click and updates the result and score label
    /// - Parameter sender: sender any
    @IBAction func tappedTriangle(sender:Any){
        let value = Predictions.shared.check(prediction: .triangle)
        var emojiTimer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { _ in
            if value == true {
                self.resultLBL.text = "😎"
            }
            else{
                self.resultLBL.text = "😱"
            }
            
            
        }
        var questionTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.resultLBL.text = "?"
        }
        Predictions.shared.generateQuestion()
        self.scoreLBL.text = "\(Predictions.shared.numCorrect())/\(Predictions.shared.numAttempted())"
        
        
        
    }
    
    /// click event for star click and updates the result and score label
    /// - Parameter sender: <#sender description#>
    @IBAction func tappedStar(sender:Any){
        let value = Predictions.shared.check(prediction: .star)
        var emojiTimer = Timer.scheduledTimer(withTimeInterval: 0, repeats: false) { _ in
            if value == true {
                self.resultLBL.text = "😎"
            }
            else{
                self.resultLBL.text = "😱"
            }
            
            
        }
        var questionTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
            self.resultLBL.text = "?"
        }
        Predictions.shared.generateQuestion()
        self.scoreLBL.text = "\(Predictions.shared.numCorrect())/\(Predictions.shared.numAttempted())"
        
        
    }
    
    
}

