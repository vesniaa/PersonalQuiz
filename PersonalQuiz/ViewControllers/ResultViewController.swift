//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Евгения Аникина on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var resultNavigationItem: UINavigationItem!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var characteristicLabel: UILabel!
    
    //MARK: - Public Properties
    var answers: [Answer] = []
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        getResult()
        
    }
    
    //MARK: - Private Methods
        private func getResult() {
           
            var answersCounts: [AnimalType: Int] = [
                AnimalType.dog : 0,
                AnimalType.cat : 0,
                AnimalType.rabbit : 0,
                AnimalType.turtle : 0
            ]
            
            for answer in answers {
                answersCounts[answer.type]! += 1
            }
            
            let sortedAnswersCounts = answersCounts.sorted { $0.1 > $1.1 }
            
            let resultType = sortedAnswersCounts.first?.key
            let typeCharacter = resultType?.rawValue
            
            animalLabel.text = "Вы - \(typeCharacter!)!"
            characteristicLabel.text = resultType?.definition

        }
    
    }


