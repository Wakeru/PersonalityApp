//
//  ViewController.swift
//  Personality
//
//  Created by Sean Escot on 12/10/22.
//“On my honor, I have neither received nor given any unauthorized assistance on this assignment.”

import UIKit

class introViewController: UIViewController {

    @IBAction func startQuizPressed(_ sender: Any) {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

