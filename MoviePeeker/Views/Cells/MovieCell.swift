//
//  MovieCell.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

class MovieCell: UITableViewCell {
    static let reuseId = "MovieCell"
    
    // MARK: - UI Properties
    private lazy var containerView: UIView = makeUIElement { view in
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
    }
    
    private lazy var posterImageView: UIImageView = makeUIElement { imageView in
        imageView.layer.cornerRadius = 10
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        imageView.layer.masksToBounds = true
        imageView.contentMode = .redraw
    }
    
    private lazy var titleLabel: UILabel = makeUIElement { label in
        label.textColor = .black
        label.font = .montserratBold(ofSize: 20)
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.text = "Movie Title"
    }
    
    private lazy var releaseDate: UILabel = makeUIElement { label in
        label.text = "Release date: 22/01/2023"
        label.font = .hindGunturMedium(ofSize: 14)
    }
    
    private lazy var votesLabel: UILabel = makeUIElement { label in
        label.text = "Rating: 0.0"
        label.font = .hindGunturMedium(ofSize: 14)
    }
    
    private lazy var stackView: UIStackView = makeUIElement { stackView in
        stackView.axis = .vertical
        stackView.spacing = 4
    }
    
    private lazy var overviewLabel: UILabel = makeUIElement { label in
        label.numberOfLines = 0
        label.font = .mulish(ofSize: 10, type: .mediumItalic)
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
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            posterImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.4)
        ])
    }
    
    private func configureStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(releaseDate)
        stackView.addArrangedSubview(votesLabel)
        
        containerView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 4),
            stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2)
        ])
    }
    
    private func configureOverview() {
        containerView.addSubview(overviewLabel)
        
        NSLayoutConstraint.activate([
            overviewLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            overviewLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            overviewLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            overviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -4)
        ])
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.dropShadow()
    }
}

extension MovieCell {
    func setupCell(_ movie: MovieViewModel) {
        titleLabel.text = movie.title
        releaseDate.text = "Release date: \(movie.releaseDate.toFormat(from: "yyyy-mm-dd", to: "dd/mm/yyyy"))"
        votesLabel.text = "Rating: \(movie.rating)"
        overviewLabel.text = movie.overview
        posterImageView.image = movie.poster
    }
}



// MARK: - Previewers
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
