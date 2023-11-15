//
//  String+Extensions.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

extension String {
    func toFormat(from previous: String, to format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = previous
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        let outDateFormatter = DateFormatter()
        outDateFormatter.dateFormat = format
        return outDateFormatter.string(from: date)
    }
}
