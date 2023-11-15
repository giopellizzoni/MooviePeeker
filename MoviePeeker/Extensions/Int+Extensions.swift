//
//  Int+Extensions.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import Foundation

extension Int {
    
    func toCurrencyString() -> String? {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "en-US")
        return currencyFormatter.string(from: self as NSNumber)
    }
}
