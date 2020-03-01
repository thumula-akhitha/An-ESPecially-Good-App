//
//  Predictions.swift
//  An ESPecially Good App
//
//  Created by student on 2/29/20.
//  Copyright © 2020 student. All rights reserved.
//

import Foundation
enum Shape{
    case circle,triangle,star
}
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
    func generateQuestion(){
                
    }
    
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
    func numAttempted() -> Int{
        return questions.count
    }
    func numCorrect() -> Int{
        return 1
       /* for val in 0...questions.count{
            if questions[val] == {
                
            }
        }*/
    }
    
}
