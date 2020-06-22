//
//  MoviesPresenter.swift
//  VIP
//
//  Created by ITAU on 15-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB



class MoviesPresenter: MoviePresenter {

    weak var mainView: MovieView?
    var navigation: UINavigationController?
    var interactor: MovieListInteractorInputDelegate?

    func goToDetailMovie(movie: MovieResume) {
        //ROUTER navigate to details
    }

    func successFetchMovies(movies: [MovieResume]) {
        self.mainView?.displayMovies()
    }

    func errorFetchMovies() {
        self.mainView?.displayError()
    }

    func successFetchMovie(movie: MovieResume) {
        
    }

    func errorFetchMovieSelected() {
        
    }

}


