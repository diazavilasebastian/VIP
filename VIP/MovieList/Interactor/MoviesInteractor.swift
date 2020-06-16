//
//  MoviesInteractor.swift
//  VIP
//
//  Created by ITAU on 15-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB


class MoviesInteractor: MovieInteractor {

    var dataSource: MoviesDataSource
    var presenter: MoviePresenter?
    var provider: MovieProvider

    var page: Int = 0

    init(provider: MovieProvider){
        self.dataSource = MoviesDataSource()
        self.provider = provider
    }

    func fetchUpcomingMovies() {
        provider.getUpcoming(page: self.page) { [weak self] result in
            switch result {
            case .success(let moviePage):
                self?.page = moviePage.page + 1
                self?.dataSource.append(moviesNews: moviePage.results)
                self?.presenter?.successFetchMovies(movies: moviePage.results)
            case .failure(let error):
                debugPrint(error)
                self?.presenter?.errorFetchMovies()
            }
        }

    }

    func getMovieResume(index: IndexPath) {
        if let movieResume = dataSource.getMovie(row: index.row) {
            presenter?.successFetchMovie(movie: movieResume)
        }
    }


}
