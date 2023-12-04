//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var animalResultLabel: UILabel!
    @IBOutlet var animalNameLabel: UILabel!
    
    var answer: [Answer]!
    
    var animalResult: String!
    var animalName: String!
    
    private var rabbitСhoice = 0
    private var dogСhoice = 0
    private var catСhoice = 0
    private var turtleСhoice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseOutput()
        
        animalNameLabel.text = animalName
        animalResultLabel.text = animalResult
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
        
    func responseOutput() {
        countingCorrectAnswers()
        let animalChoise = [dogСhoice, catСhoice, rabbitСhoice, turtleСhoice]
        
        answer.forEach { answer in
            
            if dogСhoice == animalChoise.max() {
                description()
            } else if catСhoice == animalChoise.max(){
                description()
            } else if rabbitСhoice == animalChoise.max(){
                description()
            } else if turtleСhoice == animalChoise.max(){
                description()
            }

        }
        
        print("maximum count enimal")
        print(animalChoise.max() ?? "")
        print("and other animal count")
        print(dogСhoice, catСhoice, rabbitСhoice, turtleСhoice)
    }
    
    func description() {
        answer.forEach { answer in
            switch answer.animal {
            case .dog:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalName = answer.animal.definition
            case .cat:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalName = answer.animal.definition
            case .rabbit:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalName = answer.animal.definition
            case .turtle:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalName = answer.animal.definition
            }
        }
    }
    
    func countingCorrectAnswers() {
        answer.forEach { answer in
            switch answer.animal {
                
            case .dog:
                dogСhoice += 1
            case .cat:
                catСhoice += 1
            case .rabbit:
                rabbitСhoice += 1
            case .turtle:
                turtleСhoice += 1
            }
        }
    }
}
