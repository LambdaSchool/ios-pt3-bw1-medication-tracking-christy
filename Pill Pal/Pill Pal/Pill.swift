//
//  Pill.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation
struct Pill: Codable, Equatable {
    var name: String
    var isPrescription: Bool
    var numberOfPills: UInt
    var dosage: UInt?
    var dosageType: String?
    var frequency: Frequency
}

enum Frequency: String, Codable, CaseIterable {
    case twiceDaily = "Twice Daily"
    case daily = "Daily"
    case weekly = "Weekly"
    case monthly = "Monthly"
    
    // static var frequencies: [Frequency] {
    //    return [.twiceDaily, .daily, .weekly, .monthly]
   //}
    
}


