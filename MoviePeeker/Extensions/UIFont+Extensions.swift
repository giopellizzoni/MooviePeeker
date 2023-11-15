//
//  UIFont+Extensions.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

enum MulishType {
    case mediumItalic
    case medium
    case regular
    case mulishItalic
}

extension UIFont {
    static func montserratBold(ofSize size: CGFloat, isItalic: Bool = false) -> UIFont? {
        return UIFont(name: isItalic ? "Montserrat-BoldItalic" : "Montserrat-Bold", size: size)!
    }
    
    static func hindGunturMedium(ofSize size : CGFloat) -> UIFont? {
        return UIFont(name: "HindGuntur-Medium", size: size)
    }
    
    static func mulish(ofSize size: CGFloat, type: MulishType) -> UIFont? {
        var name: String = ""
        switch type {
        case .mediumItalic:
            name = "Mulish-MediumItalic"
        case .medium:
            name = "Mulish-Medium"
        case .regular:
            name = "Mulish-Regular"
        case .mulishItalic:
            name = "Mulish-Italic"
        }
        
        return UIFont(name: name, size: size)
    }
    
    
}
