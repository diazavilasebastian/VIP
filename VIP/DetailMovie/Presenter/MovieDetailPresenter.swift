//
//  MovieDetailPresenter.swift
//  VIP
//
//  Created by ITAU on 23-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MovieDetailPresenter: PresenterDetailMovie {

    weak var mainView: ViewDetailMovie?

    func successDetailMovie(movie: Movie) {
        let viewModel = MovieDetailViewModel(movie: movie)
        self.mainView?.refreshMovieDetail(movie: viewModel)
    }

    func errorFetchDetailMovie(error: Error) {
        self.mainView?.errorFetchMovieDetail(error: error)
    }

}
