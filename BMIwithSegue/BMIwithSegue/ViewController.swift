//
//  ViewController.swift
//  BMIwithSegue
//
//  Created by Aigerim on 23.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var sliderHeight: UISlider!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightSlider: UISlider!
    @IBOutlet private var weightLabel: UILabel!
    
    var bmiModel: BmiResultModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderDidChange(_ sender: UISlider) {
        let formattedValue = String(format: "%.2f", sender.value)
        if sender == sliderHeight {
            heightLabel.text = formattedValue
        } else {
            weightLabel.text = formattedValue
        }
    }
    
    @IBAction func buttonDidTap(_ sender: UIButton) {
        calculate()
        performSegue(withIdentifier: "resultBMI", sender: self)
    }
    
    func calculate() {
        let height = sliderHeight.value
        let weight = weightSlider.value
        
        let result = weight / pow(height, 2)
        let formatterResult = String(format: "%.2f", result)
        
        if result < 18.5 {
            bmiModel = BmiResultModel(result: formatterResult, advice: "Eat More Pies", color: .cyan)
        } else if result < 24.9 {
            bmiModel = BmiResultModel(result: formatterResult, advice: "Normal", color: .green)
        } else {
            bmiModel = BmiResultModel(result: formatterResult, advice: "Stop Eating", color: .red)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "resultBMI" {
            if let resultVC = segue.destination as? BMIViewController {
                resultVC.model = bmiModel
            }
       }
    }
}
    

    
    
