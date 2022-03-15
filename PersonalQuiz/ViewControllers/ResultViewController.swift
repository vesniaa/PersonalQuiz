//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Евгения Аникина on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var resultNavigationItem: UINavigationItem!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var characteristicLabel: UILabel!
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupLabels()

    }
    private func setupNavigationItem() {
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
    }
    private func setupLabels() {
        if let animalType = getFrequentAnimalTypeInAnswers() {
            animalLabel.text = "Вы - \(animalType.rawValue)!"
            characteristicLabel.text = animalType.definition
        }
    }
    
    private func getFrequentAnimalTypeInAnswers() -> AnimalType? {
        var countAnimalTypes: [AnimalType: Int] = [:]
        for answer in answersChosen {
            let answerType = answer.type
            countAnimalTypes[answerType] = (countAnimalTypes[answerType] ?? 0) + 1
        }
        
        return countAnimalTypes.max { $0.value < $1.value }?.key
    }
}
