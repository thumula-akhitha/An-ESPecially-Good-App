//
//  Predictions.swift
//  An ESPecially Good App
//
//  Created by student on 2/29/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation

/// enum of type shape
enum Shape{
    case circle,triangle,star
}


/// struct this accepts 2 stored values and 1 computed values
struct Question{
    var actualShape:Shape!
    var predictedShape:Shape!
    var isCorrect:Bool?{
        if actualShape == predictedShape {
            return true
        }
        else if actualShape == nil || predictedShape == nil{
            return nil
        }
        else {
            return false
        }
    }
}

/// Prediction class is a singleton call
class Predictions{
    
    private static var _shared:Predictions!
    
    static var shared: Predictions{
        if _shared == nil
        {
            _shared = Predictions()
        }
        return _shared
    }
    private var questions:[Question] = []
    private var currentQuestion:Question!
    
    
    /// this generate each question of the actual shape
    func generateQuestion(){
        currentQuestion = Question()
        currentQuestion.predictedShape = nil
        let randomQuestion = Int.random(in: 0...3)
        if randomQuestion == 0 {
            currentQuestion.actualShape = Shape.circle
            
        }
        else if randomQuestion == 1 {
            currentQuestion.actualShape = Shape.triangle
        }
        else{
            currentQuestion.actualShape = Shape.star
        }
        
    }
    
    /// it checks whether it is prediction shape
    /// - Parameter prediction: predicted value
    func check(prediction:Shape) -> Bool{
        currentQuestion.predictedShape = prediction
        questions.append(currentQuestion)
        if currentQuestion.isCorrect == true{
            return true
        }
        else{
            return false
        }
    }
    
    /// returns the number of attempted questions
    func numAttempted() -> Int{
        return questions.count
    }
    
    /// returns the number of predicted questions
    func numCorrect() -> Int{
        var count = 0
        for val in 0..<questions.count{
            if questions[val].isCorrect!{
                count = count + 1
                
            }
        }
        return count
    }
    
    /// its clears the values of the question array
    func clearResults(){
        questions=[]
    }
    
    private init(){
        generateQuestion()
    }
    
    ///returns the question at particular index
    func question(at:Int)->Question!{
        if at >= 0 && at < questions.count {
            return questions[at]
        } else {
            return nil
        }
        
    }
    
}
