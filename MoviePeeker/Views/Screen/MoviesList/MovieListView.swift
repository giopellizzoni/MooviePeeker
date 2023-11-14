//
//  MovieListView.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import UIKit


class MovieListView: UIView {
    
    private let viewModel: MovieListViewModelProtocol!
    
    private(set) lazy var titleLabel: TitleLabel = {
        let label = TitleLabel(title: "Movies Peeker")
        return label
    }()
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.separatorColor = .clear
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.reuseId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
    
    init(viewModel: MovieListViewModelProtocol!) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MovieListView {
    func configureUI() {
        configureTitleLabel()
        configureTableView()
        Task {
            do {
                try await viewModel.loadMovies()
                self.tableView.reloadData()
            } catch {
                print(error)
            }
            
        }
    }
    
    func configureTitleLabel() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            titleLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    func configureTableView() {
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

extension MovieListView : UITableViewDelegate {
    
}

extension MovieListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let moviesCount = viewModel.movies?.results.count else { return 0 }
        return moviesCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseId) as? MovieCell,
              let movie = viewModel.movies?.results[indexPath.row] else {
            return UITableViewCell()
        }
        
        cell.setupCell(movie)
        return cell
    }
}
