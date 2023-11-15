//
//  UILabel+Extension.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit


extension UILabel {
    func makeHyperLink(_ address: String, text: String? = nil) {
        let attributedString = NSMutableAttributedString(string: text ?? address)
        
        attributedString.addAttribute(.link, value: address, range: getRange(for: text ?? address))
        self.attributedText = attributedString;
    }
    
    private func getRange(for text: String) -> NSRange {
        return (text as NSString).range(of: text)
    }
}
