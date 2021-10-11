//
//  Question.swift
//  FewDrinks
//
//  Created by Schwering, Marvin, SEVEN PRINCIPLES on 10.10.21.
//

import Foundation

struct Question : Codable, Identifiable {
    enum CodingKeys : CodingKey {
        case question
        case choice_one
        case choice_two
    }
    
    var id = UUID()
    var question : String
    var choiceOne : String
    var choiceTwo : String
}
