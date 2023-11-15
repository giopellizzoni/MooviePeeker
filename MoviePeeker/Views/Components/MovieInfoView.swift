//
//  MovieInfoView.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

class MovieInfoView: UIView {

    private lazy var titleLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.text = "Movie Title"
    }
    
    private lazy var taglineLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
        
        label.numberOfLines = 3
    }
    
    private lazy var homepageLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    private lazy var releaseDateLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    private lazy var budgetLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    private lazy var revenueLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    private lazy var ratingLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    private lazy var overviewLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.numberOfLines = 0
    }
    
    private lazy var detailsStackView: UIStackView = makeUIElement { stackView in
        stackView.axis = .vertical
        stackView.spacing = 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieInfoView {
    
    private func configureViews() {
        configureStackview()
    }
    
    private func configureStackview() {
        detailsStackView.addArrangedSubview(titleLabel)
        detailsStackView.addArrangedSubview(taglineLabel)
        detailsStackView.addArrangedSubview(homepageLabel)
        detailsStackView.addArrangedSubview(releaseDateLabel)
        detailsStackView.addArrangedSubview(budgetLabel)
        detailsStackView.addArrangedSubview(revenueLabel)
        detailsStackView.addArrangedSubview(ratingLabel)
        detailsStackView.addArrangedSubview(overviewLabel)
        
        addSubview(detailsStackView)
        NSLayoutConstraint.activate([
            detailsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailsStackView.topAnchor.constraint(equalTo: topAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailsStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setupInfo(details: DetailsViewModel) {
        titleLabel.text = details.title
        taglineLabel.text = details.tagline
        homepageLabel.text = details.homepage
        releaseDateLabel.text = "Released date: \(details.releaseDate.toFormat(from: "yyyy-mm-dd", to: "dd/mm/yyyy")) "
        budgetLabel.text = "Budget: \(details.budget.toCurrencyString() ?? "N/A")"
        revenueLabel.text = "Revenue: \(details.revenue.toCurrencyString() ?? "N/A")"
        ratingLabel.text = "Rating: \(details.rating)"
        overviewLabel.text = details.overview
    }
}
