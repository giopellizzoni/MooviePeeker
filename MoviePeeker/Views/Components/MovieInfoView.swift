//
//  MovieInfoView.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

class MovieInfoView: UIView {

    private var url: URL?
    
    private lazy var titleLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .montserratBold(ofSize: 22)
        label.numberOfLines = 3
    }
    
    private lazy var taglineLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .hindGunturMedium(ofSize: 18)
    }
    
    private lazy var homepageLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .hindGunturMedium(ofSize: 18)
        label.isUserInteractionEnabled = true
        label.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private lazy var releaseDateLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .hindGunturMedium(ofSize: 18)
        label.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private lazy var budgetLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .hindGunturMedium(ofSize: 18)
        label.setContentHuggingPriority(.required, for: .vertical)
    }
    
    private lazy var revenueLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .hindGunturMedium(ofSize: 18)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private lazy var ratingLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .hindGunturMedium(ofSize: 18)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private lazy var overviewLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .mulish(ofSize: 16, type: .mediumItalic)
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private lazy var detailsStackView: UIStackView = makeUIElement { stackView in
        stackView.axis = .vertical
        stackView.spacing = 4
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(taglineLabel)
        stackView.addArrangedSubview(homepageLabel)
        stackView.addArrangedSubview(releaseDateLabel)
        stackView.addArrangedSubview(budgetLabel)
        stackView.addArrangedSubview(revenueLabel)
        stackView.addArrangedSubview(ratingLabel)
        stackView.addArrangedSubview(overviewLabel)
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
//        detailsStackView.addArrangedSubview(titleLabel)
//        detailsStackView.addArrangedSubview(taglineLabel)
//        detailsStackView.addArrangedSubview(homepageLabel)
//        detailsStackView.addArrangedSubview(releaseDateLabel)
//        detailsStackView.addArrangedSubview(budgetLabel)
//        detailsStackView.addArrangedSubview(revenueLabel)
//        detailsStackView.addArrangedSubview(ratingLabel)
//        detailsStackView.addArrangedSubview(overviewLabel)
        
        addSubview(detailsStackView)
        NSLayoutConstraint.activate([
            detailsStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            detailsStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            detailsStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupInfo(details: DetailsViewModel) {
        titleLabel.text = details.title
        taglineLabel.text = details.tagline
        makeLabelHyperLink(url: details.homepage)
        releaseDateLabel.text = "Released date: \(details.releaseDate.toFormat(from: "yyyy-mm-dd", to: "dd/mm/yyyy")) "
        budgetLabel.text = "Budget: \(details.budget.toCurrencyString() ?? "N/A")"
        revenueLabel.text = "Revenue: \(details.revenue.toCurrencyString() ?? "N/A")"
        ratingLabel.text = "Rating: \(details.rating)"
        overviewLabel.text = details.overview
    }
    
    @objc func openLink(_ sender: UILabel) {
        if let url = self.url {
            UIApplication.shared.open(url)
        }
    }
    
    private func makeLabelHyperLink(url: String?) {
        homepageLabel.text = url
        if let stringURL = url {
            self.url = URL(string: stringURL)
            homepageLabel.makeHyperLink(stringURL)
            let tap = UITapGestureRecognizer(target: self, action: #selector(openLink(_:)))
            homepageLabel.addGestureRecognizer(tap)
        }
    }
}
