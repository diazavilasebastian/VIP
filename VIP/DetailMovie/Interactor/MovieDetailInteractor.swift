//
//  MovieDetailInteractor.swift
//  VIP
//
//  Created by ITAU on 23-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MovieDetailInteractor: InteractorDetailMovie {


    var presenter: PresenterDetailMovie?
    var provider: MovieProvider?

    init(provider: MovieProvider?){
        self.provider = provider
    }

    func fetchDetailMovie(idMovie: Int) {
        self.provider?.getMovie(id: idMovie) { result in
            switch result {
            case .success(let movie):
                self.presenter?.successDetailMovie(movie: movie)
            case .failure(let error):
                debugPrint(error)
                self.presenter?.errorFetchDetailMovie(error: error)
            }
        }
    }

}
