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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func isPrescriptionToggled(_ sender: Any) {
    }
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
