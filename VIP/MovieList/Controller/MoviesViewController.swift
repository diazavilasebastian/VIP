//
//  ViewController.swift
//  VIP
//
//  Created by ITAU on 11-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import UIKit
import iOSMovieDB

protocol MoviesViewModel {
    var presenter: MoviePresenter { get }
    var interactor: MovieInteractor { get }
    var dataSource: MoviesDataSource { get }
}

class MoviesViewController: UIViewController {

    var mainView: MovieCollectionView

    var presenter: MoviePresenter?
    var interactor: MovieInteractor?

    init(viewModel: MoviesViewModel) {
        self.presenter = viewModel.presenter
        self.interactor = viewModel.interactor
        self.mainView = MovieCollectionView(frame: .zero)
        mainView.dataSource = viewModel.dataSource
        super.init(nibName: nil, bundle: nil)
        mainView.delegate = self
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        interactor?.fetchUpcomingMovies()
    }
}

extension MoviesViewController: MovieView {
    func MovieSelected(movie: MovieResume) {
        self.presenter?.goToDetailMovie(movie: movie)
    }

    func displayMovies() {
        self.mainView.reloadData()
    }

    func displayError() {
        debugPrint("Error get Data")
    }
}

extension MoviesViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.interactor?.getMovieResume(index: indexPath)
    }
}

