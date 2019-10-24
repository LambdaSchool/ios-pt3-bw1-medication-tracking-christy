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
        let dosageString = String(pill.dosage)
        
        // Assign pill values to labels
        nameLabel.text = pill.name
        quantityLabel.text = quantityString
        dosageLabel.text = dosageString
        dosageTypeLabel.text = pill.dosageType
        frequencyLabel.text = pill.frequency.rawValue
       // nextPillAtLabel.text =  // Need to configure timers before I can complete this
    }
/*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
*/
}
