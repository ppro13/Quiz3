//
//  Answer.swift
//  Quiz3
//
//  Created by Pedro Paulo on 02/11/17.
//  Copyright © 2017 Pedro Paulo. All rights reserved.
//

import Foundation
import UIKit

class Answer{
    
    var stringAnswer: String!
    var isCorrect: Bool!
    
    init(answer: String, isCorrect: Bool){
        self.stringAnswer = answer
        self.isCorrect = isCorrect
    }
    
}
