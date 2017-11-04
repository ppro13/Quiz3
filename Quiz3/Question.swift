//
//  Question.swift
//  Quiz3
//
//  Created by Pedro Paulo on 02/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import Foundation
import UIKit

class Question{
    
    var stringQuestion: String!
    var imageQuestion: UIImage!
    var answers: [Answer]!
    var isMultipleAnswer: Bool
    var countAnswers: Int
    
    init(question: String, stringNameFile: String, answer: [Answer]){
        self.stringQuestion = question
        self.imageQuestion = UIImage(named: stringNameFile)
        self.answers = answer
        self.isMultipleAnswer = false
        self.countAnswers = 1
    }
    
    init(question: String, stringNameFile: String, answer: [Answer], isMultipleAnswer: Bool, countAnswers: Int){
        self.stringQuestion = question
        self.imageQuestion = UIImage(named: stringNameFile)
        self.answers = answer
        self.isMultipleAnswer = isMultipleAnswer
        self.countAnswers = countAnswers
    }
}
