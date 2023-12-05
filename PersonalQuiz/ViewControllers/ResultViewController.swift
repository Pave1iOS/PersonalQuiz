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
    var animalDescription: String!
    
    private var rabbitСhoice = 0
    private var dogСhoice = 0
    private var catСhoice = 0
    private var turtleСhoice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResult()
        
        animalNameLabel.text = animalDescription
        animalResultLabel.text = animalResult
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
        
    func showResult() {
        calculateChoice()
        
        let animalsChoice = [dogСhoice, catСhoice, rabbitСhoice, turtleСhoice]
        
        answer.forEach { answer in
            switch answer.animal {
            case .dog where dogСhoice == animalsChoice.max():
                description()
            case .cat where catСhoice == animalsChoice.max():
                description()
            case .rabbit where rabbitСhoice == animalsChoice.max():
                description()
            case .turtle where turtleСhoice == animalsChoice.max():
                description()
            default:
                break
            }
        }
        
        //Проверка ответов
        print("dog = \(dogСhoice), cat = \(catСhoice), rabbit = \(rabbitСhoice), turtle = \(turtleСhoice)")
        
    }
    
    func description() {
        answer.forEach { answer in
            switch answer.animal {
            case .dog:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalDescription = answer.animal.definition
            case .cat:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalDescription = answer.animal.definition
            case .rabbit:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalDescription = answer.animal.definition
            case .turtle:
                animalResult = "Вы - \(answer.animal.rawValue)"
                animalDescription = answer.animal.definition
            }
        }
    }
    
    func calculateChoice() {
        
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

