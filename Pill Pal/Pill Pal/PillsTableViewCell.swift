//
//  PillsTableViewCell.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class PillsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var dosageTypeLabel: UILabel!
    @IBOutlet weak var frequencyLabel: UILabel!
    @IBOutlet weak var nextPillAtLabel: UILabel!
    
    // MARK: - Properties
    
    var pill: Pill? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - View
    func updateViews() {
        guard let pill = pill else { return }
        
        // Convert UInt values to Strings
        let quantityString = String(pill.numberOfPills)
        
        if pill.dosage != nil {
            let dosageString = String(pill.dosage!)
            dosageLabel.text = dosageString
        }
        
        // Assign pill values to labels
        nameLabel.text = pill.name
        quantityLabel.text = quantityString
        
        dosageTypeLabel.text = pill.dosageType
        frequencyLabel.text = pill.frequency.rawValue
        // nextPillAtLabel.text =  // Need to configure before I can complete this
    }
}
