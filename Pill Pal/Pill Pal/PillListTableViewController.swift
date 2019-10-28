//
//  PillListTableViewController.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

class PillListTableViewController: UITableViewController {
 // MARK: - View
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    let pillModelController = PillModelController()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

     override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         
         if section == 0 {
             
             return pillModelController.prescriptionPills.count == 0 ? "" : "Prescriptions"
             
         } else if section == 1 {
             
             return pillModelController.supplementPills.count == 0 ? "" : "Supplements"
         }
         
         return nil
     }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pillsFor(section: section).count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PillCell", for: indexPath) as? PillsTableViewCell else { fatalError("Did not find cell") }
        
        cell.pill = pillsFor(section: indexPath.section)[indexPath.row]

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            pillModelController.delete(pill: pillsFor(section: indexPath.section)[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "editPillFromListSegue":
            guard let vc = segue.destination as? AddEditViewController,
                let cell = sender as? PillsTableViewCell else { return }
                    
                    vc.pillModelController = pillModelController
                    vc.pill = cell.pill
        
        case "addPillFromListSegue":
            guard let vc = segue.destination as? AddEditViewController else { return }
            
            vc.pillModelController = pillModelController
            
        case "printPillSegue":
            guard let vc = segue.destination as? PrintViewController else { return }
            print("Still need to configure \(vc)")
            
        default:
            fatalError("Could not find segue")
             
        }
    }
}

extension PillListTableViewController {
    func pillsFor(section: Int) -> [Pill] {
        if section == 0 {
            return pillModelController.prescriptionPills
        } else if section == 1 {
           return pillModelController.supplementPills
        }
        return []
    }
}

