//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    @IBOutlet var enimalResultLabel: UILabel!
    @IBOutlet var enimalNameLabel: UILabel!
    
    var answer: [Answer]!
    
    var enimalResult: String!
    var enimalName: String!
    
    private var rabbitСhoice = 0
    private var dogСhoice = 0
    private var catСhoice = 0
    private var turtleСhoice = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        responseOutput()
        
        enimalNameLabel.text = enimalName
        enimalResultLabel.text = enimalResult
        

    }
    
    
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
}

private extension ResultViewController {
        
    func responseOutput() {
        countingCorrectAnswers()
        let animalChoise = [dogСhoice, catСhoice, rabbitСhoice, turtleСhoice]
        
        if dogСhoice == animalChoise.max() {
            enimalResult = "Вы - 🐶"
            enimalName = "Вы собака"
        } else if catСhoice == animalChoise.max(){
            enimalResult = "Вы - 🐱"
            enimalName = "Вы кошка"
        } else if rabbitСhoice == animalChoise.max(){
            enimalResult = "Вы - 🐰"
            enimalName = "Вы заяц"
        } else if turtleСhoice == animalChoise.max(){
            enimalResult = "Вы - 🐢"
            enimalName = "Вы черепаха"
        }
        
        print("maximum count enimal")
        print(animalChoise.max() ?? "")
        print("and other animal count")
        print(dogСhoice, catСhoice, rabbitСhoice, turtleСhoice)
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
