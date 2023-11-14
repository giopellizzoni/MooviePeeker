//
//  GlobalFunctions.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

func makeUIElement<T: UIView>(configuration: (T) -> Void) -> T {
    let element = T()
    element.translatesAutoresizingMaskIntoConstraints = false
    configuration(element)
    return element
}
