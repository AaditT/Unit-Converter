//
//  ViewController.swift
//  Unit Converter
//
//  Created by Aadit Trivedi on 6/4/20.
//  Copyright © 2020 Aadit Trivedi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let pickerData = ["Centimeter", "Inch", "Foot", "Meter", "Yard", "Mile"]
    
    var unitBrain = UnitBrain()
    var inputUnits = 0
    var outputUnits = 0
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var inputPicker: UIPickerView!
    @IBOutlet weak var outputPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        resultLabel.text = "\(0.0)"
        resultLabel.layer.borderColor = #colorLiteral(red: 0.1465680003, green: 0.3787695169, blue: 0.6278679371, alpha: 1)
        resultLabel.layer.borderWidth = 1
        resultLabel.layer.cornerRadius = 20
        resultLabel.layer.masksToBounds = true
                
        inputPicker.selectRow(inputUnits, inComponent: 0, animated: true)
        outputPicker.selectRow(outputUnits, inComponent: 0, animated: true)
        
        numberTextField.delegate = self
        inputPicker.delegate = self
        inputPicker.dataSource = self
        outputPicker.delegate = self
        outputPicker.dataSource = self
    
        numberTextField.addTarget(self, action: #selector(LabelChanged(_:)), for:.editingChanged)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case inputPicker:
            inputUnits = row
            updateUI()
        case outputPicker:
            outputUnits = row
            updateUI()
        default:
            print("Error")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @objc func LabelChanged(_ sender:Any) {
        if let doubleInput = Double(numberTextField.text!) {
            let myUnit = Unit(inputUnits: inputUnits, outputUnits: outputUnits)
            let finalVal = doubleInput * unitBrain.calculateOutput(myUnit: myUnit)
            resultLabel.text = String(format: "%.3f", finalVal)
        }
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        numberTextField.endEditing(true)
        print(numberTextField.text!)
        return true
    }
    
    
    func updateUI() {
        if let doubleInput = Double(numberTextField.text!) {
            let myUnit = Unit(inputUnits: inputUnits, outputUnits: outputUnits)
            let finalVal = doubleInput * unitBrain.calculateOutput(myUnit: myUnit)
            resultLabel.text = String(format: "%.3f", finalVal)
        }
    }

}

