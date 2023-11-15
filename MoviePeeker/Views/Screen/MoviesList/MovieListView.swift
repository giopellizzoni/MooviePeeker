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
        tableView.separatorStyle = .none
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
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
}

extension MovieListView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        viewModel.navigateToSelected(movie: movie)
    }
}

extension MovieListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.reuseId) as? MovieCell else {
            return UITableViewCell()
        }
        let movie = viewModel.movies[indexPath.row]
        cell.setupCell(movie)
        
        return cell
    }
}
