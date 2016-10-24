//
//  ViewController.swift
//  PickinFruit
//
//  Created by Flatiron School on 7/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var spinButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var fruitPicker: UIPickerView!
    
    
    var fruitsArray = ["🍎", "🍊", "🍌", "🍐", "🍇", "🍉", "🍓", "🍒", "🍍"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.spinButton.accessibilityLabel = Constants.SPIN_BUTTON
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fruitsArray.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return fruitsArray[row]

    }
    
    
    
    
    
    @IBAction func spinButtonTapped(_ sender: UIButton) {
        
        
        // pick random fruit for each component in the picker view
        for component in 0..<fruitPicker.numberOfComponents {
            
            let randomRow = Int(arc4random_uniform(UInt32(fruitsArray.count)))
            fruitPicker.selectRow(randomRow, inComponent: component, animated: true)
            
        }
        
        // check to see what fruit was picked at each component in the picker view
        
                
        let selectedFruitComponent0 = fruitsArray[fruitPicker.selectedRow(inComponent: 0)]
        let selectedFruitComponent1 = fruitsArray[fruitPicker.selectedRow(inComponent: 1)]
        let selectedFruitComponent2 = fruitsArray[fruitPicker.selectedRow(inComponent: 2)]
        
        if (selectedFruitComponent0 == selectedFruitComponent1) && (selectedFruitComponent1 == selectedFruitComponent2) {
            
            resultLabel.text = "WINNER!"
            
        } else {
            
            resultLabel.text = "TRY AGAIN"
        }
        
    }
    
    
}


// MARK: Set Up
extension ViewController {
    
    override func viewDidLayoutSubviews() {
        if self.spinButton.layer.cornerRadius == 0.0 {
            configureButton()
        }
    }
    
    func configureButton()
    {
        self.spinButton.layer.cornerRadius = 0.5 * self.spinButton.bounds.size.width
        self.spinButton.layer.borderColor = UIColor.white.cgColor
        self.spinButton.layer.borderWidth = 4.0
        self.spinButton.clipsToBounds = true
    }
    
}



