//
//  Pill.swift
//  Pill Pal
//
//  Created by Christy Hicks on 10/16/19.
//  Copyright © 2019 Knight Night. All rights reserved.
//

import Foundation
struct Pill {
    var name: String
    var isPrescription: Bool
    var numberOfPills: UInt
    var dosage: UInt
    var dosageType: String
    var frequency: Frequency
}

enum Frequency: String {
    case monthly
    case weekly
    case daily
    case twiceDaily = "2x/day"
}
