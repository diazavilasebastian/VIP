//
//  MoviesViewModel.swift
//  VIP
//
//  Created by ITAU on 16-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation

struct MoviesViewModel: MoviesViewModelProtocol {
    var presenter: MoviePresenter
    var interactor: MovieInteractor
    var dataSource: MoviesDataSource
}
