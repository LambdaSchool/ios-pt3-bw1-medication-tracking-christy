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
    
    @IBOutlet weak var instructionsButton: UIButton!
    @IBOutlet weak var addPillsButton: UIButton!
    @IBOutlet weak var viewPillsButton: UIButton!
    @IBOutlet weak var nextPillButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionsButton.clipsToBounds = true
        addPillsButton.clipsToBounds = true
        viewPillsButton.clipsToBounds = true
        nextPillButton.clipsToBounds = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let instructionHeight = instructionsButton.bounds.height
        
        instructionsButton.layer.cornerRadius = instructionHeight/2.0
        addPillsButton.layer.cornerRadius = addPillsButton.bounds.height/2.0
        viewPillsButton.layer.cornerRadius = viewPillsButton.bounds.height/2.0
        nextPillButton.layer.cornerRadius = nextPillButton.bounds.height/2.0
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
