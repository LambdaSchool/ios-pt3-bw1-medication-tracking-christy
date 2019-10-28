//
//  Pill Model Controller.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//
let demoPill: Pill = Pill(name: "Prescription", isPrescription: true, numberOfPills: 1, dosage: 100, dosageType: "mg", frequency: .daily)
let demoVitamin: Pill = Pill(name: "Vitamin", isPrescription: false, numberOfPills: 2, dosage: 100, dosageType: "mg", frequency: .daily)

import Foundation
class PillModelController {
    
    init () {
        loadFromPersistentStore()
    }
    
    // Set up an array to store prescriptions in.
    private var pills: [Pill] = [demoPill, demoVitamin]
    
    // Set up an alphabetical array of all the prescription pills.
    // FIXME: Perhaps change to be sorted by frequency?
    var prescriptionPills: [Pill] {
        let filter = pills
            .filter { $0.isPrescription }
            .sorted { $0.name < $1.name }
        return filter
    }
    
    // Set up an alphabetical array of all the supplement pills.
    var supplementPills: [Pill] {
        let filter = pills
            .filter { !$0.isPrescription }
            .sorted { $0.name < $1.name }
        return filter
    }
     // FIXME: - Correct plist name
     // Create location for saving data
     private var pillListURL: URL? {
         let fileManager = FileManager.default
         guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
         else { return nil }
            return documents.appendingPathComponent("Info.plist")
         }
     
     // Method for saving data
     func saveToPersistentStore() {

         guard let url = pillListURL else { return }
         let encoder = PropertyListEncoder()
         do {
             let pillsData = try encoder.encode(pills)
             try pillsData.write(to: url)
         } catch {
             print("Error saving pill list: \(error)")
         }
     }
     
     // Method for loading data
     func loadFromPersistentStore() {
         guard let url = pillListURL else { return }
         let decoder = PropertyListDecoder()
         
         do {
             let pillsData = try Data(contentsOf: url)
             let decodedPills = try decoder.decode([Pill].self, from: pillsData)
             pills = decodedPills
         } catch {
             print("Error loading pill list: \(error)")
         }
     }
     
     // Method to add a pill to the list
     func create(pill: Pill) {
         pills.append(pill)
         saveToPersistentStore()
     }
     
     // Method to remove a pill from the list
     func delete(pill: Pill) {
         if pills.contains(pill) {
             guard let pillIndex = pills.firstIndex(of: pill) else { return }
             pills.remove(at: pillIndex)
             saveToPersistentStore()
         }
     }
     
     // Method to update pill
     func updatePill(for pill: Pill, newName: String?, newQuantity: UInt?, newDosage: UInt?, newDosageType: String?, isPrescription: Bool, newFrequency: Frequency) {
         guard let pillIndex = pills.firstIndex(of: pill) else { return }
            var updatedPill = pill
         
            if let newPillName = newName {
                updatedPill.name = newPillName
            }
            if let newPillQuantity = newQuantity {
                updatedPill.numberOfPills = newPillQuantity
            }
            if let newPillDosage = newDosage {
                updatedPill.dosage = newPillDosage
            }
            if let newPillDosageType = newDosageType {
                updatedPill.dosageType = newPillDosageType
            }
                updatedPill.isPrescription = isPrescription
                updatedPill.frequency = newFrequency
        
            pills[pillIndex] = updatedPill
            saveToPersistentStore()
     }
}
 
 
