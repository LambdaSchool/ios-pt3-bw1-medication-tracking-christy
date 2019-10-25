//
//  AddEditViewController.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var isPrescriptionSwitch: UISwitch!
    @IBOutlet weak var numberOfPillsTextField: UITextField!
    @IBOutlet weak var dosageTextField: UITextField!
    @IBOutlet weak var dosageTypeTextField: UITextField!
    @IBOutlet weak var frequencyPickerView: FrequencyPickerView!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    // MARK: - Properties
    var pickerData: [String] = [String]()
    var pillModelController = PillModelController()
    var pill: Pill?
    
    // MARK: - View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.frequencyPickerView.delegate = self
        self.frequencyPickerView.dataSource = self
        updateViews()
        pickerData = ["twice daily", "daily", "weeky", "monthly"]
       
    }
    
    // MARK: - Actions
    @IBAction func isPrescriptionToggled(_ sender: UISwitch) {
        
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        guard pill != nil else {
            if nameTextField.text == "" || numberOfPillsTextField.text == "" {
                navigationController?.popToRootViewController(animated: true)
                return
            
            } else {
                
                let pillNumber = UInt(numberOfPillsTextField.text ?? "1")!
                let dosageNumber = UInt(dosageTextField.text ?? "0")
               let frequencyType = Frequency(rawValue: frequencyPickerView.textInputContextIdentifier ?? "daily")
                
                pillModelController.create(pill: Pill(name: nameTextField.text!, isPrescription: isPrescriptionSwitch.isOn, numberOfPills: pillNumber, dosage: dosageNumber, dosageType: dosageTypeTextField.text, frequency: frequencyType!))
                
                navigationController?.popToRootViewController(animated: true)
                
                return
            }
        }
            let pillNumber = UInt(numberOfPillsTextField.text ?? "1")!
            let dosageNumber = UInt(dosageTextField.text ?? "0")
            let frequencyType = Frequency(rawValue: frequencyPickerView.textInputContextIdentifier ?? "daily")
            
            pillModelController.updatePill(for: pill!, newName: nameTextField.text, newQuantity: pillNumber, newDosage: dosageNumber, newDosageType: dosageTypeTextField.text, isPrescription: isPrescriptionSwitch.isOn, newFrequency: frequencyType!)
            
            navigationController?.popToRootViewController(animated: true)
            
        
    }
    
    func updateViews() {
        if let pill = pill {
        nameTextField.text = pill.name
        numberOfPillsTextField.text = String(pill.numberOfPills)
        dosageTypeTextField.text = pill.dosageType
        isPrescriptionSwitch.isOn = pill.isPrescription
          //  let frequency = Frequency.frequencies[row]
         //   frequencyPickerView.selectRow(pill.frequency , inComponent: <#T##Int#>, animated: false)
            
        if pill.dosage != nil {
            let dosageString = String(pill.dosage!)
            dosageTypeTextField.text = dosageString
        }
            
    }
    }
    
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



// MARK: - Picker View Delegate and Data Source
extension AddEditViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        pickerData[row]
    }
    
}
