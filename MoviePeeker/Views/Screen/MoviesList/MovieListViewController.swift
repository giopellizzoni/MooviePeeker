//
//  MovieListViewController.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit

class MovieListViewController: UIViewController {

    private var moveListView: MovieListView!
    private var viewModel: MovieListViewModelProtocol!
    
    init(viewModel: MovieListViewModelProtocol!) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMovieListView()
    }
    
    private func setupMovieListView() {
        self.moveListView =  MovieListView(viewModel: viewModel)
        self.view = moveListView
    }
    
}
