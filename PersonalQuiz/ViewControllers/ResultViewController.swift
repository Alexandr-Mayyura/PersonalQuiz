//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultDescriptionLabel: UILabel!
    @IBOutlet var resultImageLabel: UILabel!

    var answersChosen: [Answer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        guard let answersChosen = answersChosen else { return }
        identificationOfCommonAnimals(for: answersChosen)
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func identificationOfCommonAnimals(for answers: [Answer]) {
        let animals = answers.map { $0.animal }
    
        let animalCount = NSCountedSet(array: animals)
        let yourAnimal = animalCount.max {
            animalCount.count(for: $0) < animalCount.count(for: $1)
        }
 
        guard let yourAnimal = yourAnimal as? Animal else { return }
        resultImageLabel.text = "Вы - \(String(yourAnimal.rawValue))"
        resultDescriptionLabel.text = yourAnimal.definition
       
    }
}
