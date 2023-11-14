//
//  MovieCell.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

class MovieCell: UITableViewCell {
    static let reuseId = "MovieCell"
    
    private lazy var containerView: UIView = makeUIElement { view in
        contentView.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .lightGray
    }
    
    private lazy var posterImageView = makeUIElement { imageView in
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imageView.contentMode = .scaleAspectFit
    }
    
    private lazy var titleLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.text = "Movie Title"
    }
    
    private lazy var releaseDate: UILabel = makeUIElement { label in
        label.text = "Release date: 22/22/2222"
    }
    
    private lazy var votesLabel: UILabel = makeUIElement { label in
        label.text = "Rating: 0.0"
    }
    
    private lazy var stackView: UIStackView = makeUIElement { stackView in
        stackView.axis = .vertical
    }
    
    private lazy var overviewLabel: UILabel = makeUIElement { label in
        label.text = "Recently fired and desperate for work, a troubled young man named Mike agrees to take a position as a night security guard at an abandoned theme restaurant: Freddy Fazbear's Pizzeria. But he soon discovers that nothing at Freddy's is what it seems."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10)
        label.backgroundColor = .white
        label.sizeToFit()
    }
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - UI Setup
extension MovieCell {
    private func configureUI() {
        configureContainer()
        configureImageView()
        configureStackView()
        configureOverview()
    }
    
    private func configureContainer() {
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            posterImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
            
        ])
    }
    
    private func configureStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(releaseDate)
        stackView.addArrangedSubview(votesLabel)
        
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2)
        ])
    }
    
    private func configureOverview() {
        containerView.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            overviewLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 8),
            overviewLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            overviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -4)
        ])
        
    }
}

extension MovieCell {
    func setupCell(_ movie: Movie) {
        titleLabel.text = movie.title
        releaseDate.text = movie.releaseDate
        votesLabel.text = "\(movie.voteAverage)"
        overviewLabel.text = movie.overview
    }
}


import SwiftUI


struct MovieCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCellView().frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
    }
    
    struct MovieCellView: UIViewRepresentable {
        func makeUIView(context: Context) -> UITableViewCell {
            return MovieCell()
        }
        
        func updateUIView(_ uiView: UITableViewCell, context: Context) {
            
        }
        
        typealias UIViewType = UITableViewCell
        
    }
}
