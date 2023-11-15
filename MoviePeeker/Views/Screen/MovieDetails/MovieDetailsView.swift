//
//  MovieDetailsView.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

class MovieDetailsView: UIView {

    private let viewModel: MovieDetailsViewModelProtocol!
    
    private lazy var scrollView: UIScrollView = makeUIElement { scrollView in
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    private lazy var containerView: UIView = makeUIElement { view in }
    
    private lazy var posterImageView: UIImageView = makeUIElement { imageView in
        imageView.contentMode = .scaleAspectFit
    }
    
    private lazy var infoView: MovieInfoView = makeUIElement { view in }
    
    
    // MARK: - Initializers
    init(viewModel: MovieDetailsViewModelProtocol!) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureViews()
        setupMovie()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MovieDetailsView {
    private func configureViews() {
        self.backgroundColor = .white
        configureScrollView()
        configureContainerView()
        configureImageView()
        configureInfoView()
    }
    
    private func configureScrollView() {
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func configureContainerView() {
        scrollView.addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor),
            containerView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    private func configureImageView() {
        containerView.addSubview(posterImageView)
        
        NSLayoutConstraint.activate([
            posterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func configureInfoView() {
        containerView.addSubview(infoView)
        
        NSLayoutConstraint.activate([
            infoView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            infoView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 10),
            infoView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            infoView.bottomAnchor.constraint(lessThanOrEqualTo: containerView.bottomAnchor, constant: -40)
        ])
    }
}

extension MovieDetailsView {
    private func setupMovie() {
        Task {
            let details = try await viewModel.getMovieDetails()
            posterImageView.image = details.poster
            infoView.setupInfo(details: details)
        }
        
    }
}
