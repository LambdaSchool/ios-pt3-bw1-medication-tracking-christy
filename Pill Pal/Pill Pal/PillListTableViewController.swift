//
//  PillListTableViewController.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import UIKit

//let demoPill: Pill = Pill(name: "Health Improver", isPrescription: true, numberOfPills: 1, dosage: 100, dosageType: "mg", frequency: .daily)

class PillListTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        
        // pillCell.delegate = self  // No delegate yet
        cell.pill = pillsFor(section: indexPath.section)[indexPath.row]

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


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
        /*
         if segue.identifier == "addBookSegue" {
                     guard let vc = segue.destination as? BookDetailViewController else { return }
                     
                     vc.bookController = bookController
                     
             } else if segue.identifier == "showBookSegue" {
                     
                     guard let vc = segue.destination as? BookDetailViewController,
                         
                     let cell = sender as? BookTableViewCell else { return }
             
                     vc.bookController = bookController
                     vc.book = cell.book
                     
             }
         }         */
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
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

