//
//  QuestionData.swift
//  Personality

import Foundation

struct QuestionData  {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}


struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character { //forgot to add character
    case dog = "🐶", cat = "🐱", rabbit = "🐰" , turtle = "🐢"
    
    var defintion: String{
        switch self {
        case .dog:
            return "You are incredibly outgoing and enjoy spending time with those who you love"
        case .cat:
            return "You are mischevious, you march to the beat to your own drum"
        
        case .rabbit:
            return "You love everything that is soft, and very sweet"
            
        case .turtle:
            return "you are wise and pay attention to details, slow and steady wins the race"
        }
    }
}




