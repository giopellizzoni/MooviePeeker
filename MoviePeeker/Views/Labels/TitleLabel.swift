//
//  TitleLabel.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        configure()
    }
    
    required init(title: String) {
        super.init(frame: .zero)
        configure()
        setTitle(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment = .center
        font = .systemFont(ofSize: 40, weight: .light)
        textColor = .gray
    }
    
    func setTitle(_ title: String) {
        text = title
    }
    
}
