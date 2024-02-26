//
//  Results.swift
//  Personality
//
//  Created by Sean Escot on 12/15/22.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var ResultDef: UILabel!
    
    var responses: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonality()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonality(){
        var freqOfAns: [AnimalType: Int] = [:] // could [cat : 1]
        
        let responseType = responses.map {$0.type}
        for response in responseType{
            freqOfAns[response] = (freqOfAns[response] ?? 0) + 1
        }
        
        let freqAnsSorted = freqOfAns.sorted { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        }
        let mostCommAns = freqOfAns.sorted {$0.1 > $1.1}.first!.key
            
        resultLabel.text = "you are a \(mostCommAns.rawValue)"
        ResultDef.text = mostCommAns.defintion

    }
}
