//
//  MoviesPresenter.swift
//  VIP
//
//  Created by ITAU on 15-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB
import SDWebImage

class MoviesPresenter: MoviesListPresenter {

    weak var mainView: MoviesListView?
    var navigation: UINavigationController?
    var interactor: MoviesListInteractor?

    func goToDetailMovie(movie: MovieResume) {
        //ROUTER navigate to details
    }

    func successFetchMovies(movies: [MovieResume]) {
        self.mainView?.displayMovies()
    }

    func errorFetchMovies() {
        self.mainView?.displayError()
    }

    //WIP: need some lyer to resolve dependencys
    func successFetchMovie(movie: MovieResume) {
        let presenter = MovieDetailPresenter()
        let interactor = MovieDetailInteractor(provider: self.interactor?.provider)
        if let image = SDImageCache.shared.imageFromDiskCache(forKey: movie.urlPoster?.absoluteString) {
            let viewModel = MovieViewModelResumen(movie: movie, image: image)
            let view = MovieViewController(viewModel: viewModel)
            presenter.mainView = view
            view.interactor = interactor
            interactor.presenter = presenter
            self.navigation?.show(view, sender: nil)
        }
    }

    func errorFetchMovieSelected() {}

}


