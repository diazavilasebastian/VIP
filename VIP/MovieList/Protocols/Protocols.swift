//
//  Protocols.swift
//  VIP
//
//  Created by ITAU on 12-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

typealias MoviePresenter = MovieListPresenterInputDelegate & MovieListPresenterOutputDelegate
typealias MovieInteractor = MovieListInteractorInputDelegate & MovieListInteractorOutputDelegate
typealias MovieView = MovieListViewInputDelegate & MovieListViewOutputDelegate


// Protocol to movie list view
// dislayMovies: logic to display a new collection of movies
protocol MovieListViewInputDelegate: class {
    func MovieSelected(movie: MovieResume)
    func displayMovies()
    func displayError()
}

protocol MovieListViewOutputDelegate {
    var presenter: MoviePresenter? { get set }
    var interactor: MovieInteractor? { get set }
}

//Protocol to movie list interctor
//page: page of collection movies resume
//fetchMovies: logic to get list movies from API or Data base
protocol MovieListInteractorInputDelegate: class {
    func getMovieResume(index: IndexPath)
    func fetchUpcomingMovies()
}

protocol MovieListInteractorOutputDelegate {
    var presenter: MoviePresenter? { get set }
    var provider: MovieProvider { get set }
}

//Protocol to movie list presenter
//goToDetailMovie: logic go to detail of movie
//successFetchMovies: list of movies come from interactor
//errorFetchMovies: error type when interctor try get list of movies
protocol MovieListPresenterInputDelegate: class {
    var navigation: UINavigationController? { get set }
    func goToDetailMovie(movie: MovieResume)
}

protocol MovieListPresenterOutputDelegate: class {
    var mainView: MovieView? { get set }
    func successFetchMovies(movies: [MovieResume])
    func successFetchMovie(movie: MovieResume)
    func errorFetchMovies()
    func errorFetchMovieSelected()
}
