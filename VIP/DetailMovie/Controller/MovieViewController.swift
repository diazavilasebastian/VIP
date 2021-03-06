//
//  MovieViewController.swift
//  VIP
//
//  Created by ITAU on 21-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSUI
import iOSMovieDB

protocol MovieViewModelProtocol {
    var title: String { get }
    var image: UIImage { get }
    var overview: String { get }
    var popularity: String { get }
    var idMovie: Int { get }

    func configure(view: MovieDetailView)
}

class MovieViewController: UIViewController {

    lazy var mainView: MovieDetailView = {
        let view = MovieDetailView(title: self.viewModel.title,
                                   image: self.viewModel.image,
                                   frame: .zero)
        return view
    }()

    var viewModel: MovieViewModelProtocol
    var interactor: InteractorDetailMovie?

    init(viewModel: MovieViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.configure(view: mainView)
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigation()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view = mainView
        self.interactor?.fetchDetailMovie(idMovie: self.viewModel.idMovie)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func configNavigation() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

}

extension MovieViewController: ViewDetailMovie {
    func errorFetchMovieDetail(error: Error) {
//        stop loading
    }

    func refreshMovieDetail(movie: MovieDetailViewModel) {
        movie.configure(view: self.mainView)
    }
}
