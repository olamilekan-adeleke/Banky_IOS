//
//  Decimal+Extension.swift
//  Banky_IOS
//
//  Created by Enigma Kod on 15/08/2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
