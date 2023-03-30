//
//  BMIViewController.swift
//  BMIwithSegue
//
//  Created by Aigerim on 23.04.2022.
//

import UIKit

class BMIViewController: UIViewController {
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var recommendationLabel: UILabel!
   
    var model: BmiResultModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure(with: model!)
    }
        func configure(with model: BmiResultModel) {
            resultLabel.text = model.result
            recommendationLabel.text = model.advice
            view.backgroundColor = model.color
          }
   
    @IBAction private func cancelDidTap(_ sender: UIButton) {
        dismiss(animated: true)
    }   
}

