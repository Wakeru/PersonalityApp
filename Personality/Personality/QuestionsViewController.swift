//
//  Questions.swift
//  Personality

import UIKit

class QuestionsViewController: UIViewController {
    
    //outlets
    
    @IBOutlet var questionLabel:UILabel!
    
    @IBOutlet var SingleStackView: UIStackView!
    @IBOutlet var SingleButton1: UIButton!
    @IBOutlet var SingleButton2: UIButton!
    @IBOutlet var SingleButton3: UIButton!
    @IBOutlet var SingleButton4: UIButton!

    
    
    @IBOutlet var MultipleStackView: UIStackView!
    @IBOutlet var MutltiLabel1: UILabel!
    @IBOutlet var MutltiLabel2: UILabel!
    @IBOutlet var MutltiLabel3: UILabel!
    @IBOutlet var MutltiLabel4: UILabel!
    
    @IBOutlet var MultiSwitch1: UISwitch!
    @IBOutlet var MultiSwitch2: UISwitch!
    @IBOutlet var MultiSwitch3: UISwitch!
    @IBOutlet var MultiSwitch4: UISwitch!

    
    
    @IBOutlet var RangeStackView: UIStackView!
    @IBOutlet var RangeLabel1: UILabel!
    @IBOutlet var RangeLabel2: UILabel!
    
    @IBOutlet var RangeSlider: UISlider!
    
    
    
    
    @IBOutlet var ProgressView: UIProgressView!

    
    
    
    
    
    
    var questionIndex = 0
    var chosenAnswers: [Answer] = []
    
    
    var questions: [QuestionData] = [ //asking questions and their answers to tell which animal are you depending on pick
        QuestionData(text: "Which food do you like most?", type: .single, answers: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Corn", type: .turtle),
            Answer(text: "Carrots", type: .rabbit)
        ]),
        QuestionData(text: "Which Activities do you enjoy?", type: .multiple, answers:[
            Answer(text: "Swimming", type: .dog),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .turtle)
        ]),
        QuestionData(text: "How much do you enjoy car rides?", type: .ranged, answers: [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get nervous", type: .rabbit),
            Answer(text: "I dont notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)])
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }// make sure to turn on Installed to see the questions
    
    func updateUI(){
        SingleStackView.isHidden = true //hides the stack view so it wont overlap each other
        MultipleStackView.isHidden = true
        RangeStackView.isHidden = true
        
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        ProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type { // shows the question types
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultiStack(using: currentAnswers)
        case .ranged:
            updateRangeStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]){
        SingleStackView.isHidden = false
        SingleButton1.setTitle(answers[0].text, for: .normal)
        SingleButton2.setTitle(answers[1].text, for: .normal)
        SingleButton3.setTitle(answers[2].text, for: .normal)
        SingleButton4.setTitle(answers[3].text, for: .normal)

    }
    func updateMultiStack(using answers: [Answer]){
        MultipleStackView.isHidden = false
        MutltiLabel1.text = answers[0].text
        MutltiLabel2.text = answers[1].text
        MutltiLabel3.text = answers[2].text
        MutltiLabel4.text = answers[3].text

        
    }
    func updateRangeStack(using answers: [Answer]){
        RangeStackView.isHidden = false
        RangeSlider.setValue(0.5, animated: false)
        RangeLabel1.text = answers.first?.text
        RangeLabel2.text = answers.last?.text

    }
    
    
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        switch sender {
        case SingleButton1:
            chosenAnswers.append(currentAnswers[0])
        case SingleButton2:
            chosenAnswers.append(currentAnswers[1])
        case SingleButton3:
            chosenAnswers.append(currentAnswers[2])
        case SingleButton4:
            chosenAnswers.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
    }
    
    
    @IBAction func multipleButtonPressed() {
        let currentAnswer = questions[questionIndex].answers
        
        if MultiSwitch1.isOn{
            chosenAnswers.append(currentAnswer[0])
        }
        if MultiSwitch2.isOn{
            chosenAnswers.append(currentAnswer[1])
        }
        if MultiSwitch3.isOn{
            chosenAnswers.append(currentAnswer[2])
        }
        if MultiSwitch4.isOn{
            chosenAnswers.append(currentAnswer[3])
        }
        nextQuestion()
    }
    
    
    @IBAction func RangeButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(RangeSlider.value * Float(currentAnswers.count - 1)))
        chosenAnswers.append(currentAnswers[index])
        nextQuestion()
    }
    
    func nextQuestion(){
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        }
        else{
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue"{
            let ResultsVC = segue.destination as! ResultsViewController
            ResultsVC.responses = chosenAnswers
        }
    }
    
}
