//
//  MovieDetailsViewController.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 15/11/23.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    private var movieDetailsView: MovieDetailsView!
    private var viewModel: MovieDetailsViewModelProtocol!
    
    init(viewModel: MovieDetailsViewModelProtocol!) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieDetailsView()
    }
    
    private func setupMovieDetailsView() {
        self.movieDetailsView =  MovieDetailsView(viewModel: viewModel)
        self.view = movieDetailsView
    }
}
