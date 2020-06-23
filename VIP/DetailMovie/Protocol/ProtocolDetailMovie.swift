//
//  ProtocolDetailMovie.swift
//  VIP
//
//  Created by ITAU on 23-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

typealias PresenterDetailMovie = DetailMoviePresenterInputDelegate & DetailMoviePresenterOutputDelegate
typealias ViewDetailMovie = DetailMovieViewInputDelegate & DetailMovieViewOutputDelegate
typealias InteractorDetailMovie = DetailMovieInteractorInputDelegate & DetailMovieInteractorOutputDelegate

protocol DetailMovieViewInputDelegate: class {
    func refreshMovieDetail(movie: MovieDetailViewModel)
    func errorFetchMovieDetail(error: Error)
}

protocol DetailMovieViewOutputDelegate: class {
    var interactor: InteractorDetailMovie? { get set }
}

protocol DetailMoviePresenterInputDelegate: class {
    func successDetailMovie(movie: Movie)
    func errorFetchDetailMovie(error: Error)
}

protocol DetailMoviePresenterOutputDelegate: class {
    var mainView: ViewDetailMovie?{ get set }
}

protocol DetailMovieInteractorInputDelegate: class {
    func fetchDetailMovie(idMovie: Int)
}

protocol DetailMovieInteractorOutputDelegate: class {
    var presenter: PresenterDetailMovie?{ get set }
}
