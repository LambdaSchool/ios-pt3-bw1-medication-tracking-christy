//
//  MenuViewController.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
// MARK: - Outlets
    
    @IBOutlet weak var instructionsButtton: UIButton!
    @IBOutlet weak var addPillsButton: UIButton!
    @IBOutlet weak var viewPillsButton: UIButton!
    @IBOutlet weak var nextPillButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionsButtton.layer.cornerRadius = 69
        instructionsButtton.clipsToBounds = true
        addPillsButton.layer.cornerRadius = 69
        addPillsButton.clipsToBounds = true
        viewPillsButton.layer.cornerRadius = 69
        viewPillsButton.clipsToBounds = true
        nextPillButton.layer.cornerRadius = 69
        nextPillButton.clipsToBounds = true
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
