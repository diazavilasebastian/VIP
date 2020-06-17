//
//  ViewController.swift
//  VIP
//
//  Created by ITAU on 11-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import UIKit
import iOSMovieDB

protocol MoviesViewModelProtocol {
    var presenter: MoviePresenter { get }
    var interactor: MovieInteractor { get }
    var dataSource: MoviesDataSource { get }
}

class MoviesViewController: UIViewController {

    lazy var mainView: MovieCollectionView = {
        let view = MovieCollectionView(frame: .zero)
        view.delegate = self
        return view
    }()

    var presenter: MoviePresenter?
    var interactor: MovieInteractor?

    init(viewModel: MoviesViewModelProtocol) {
        self.presenter = viewModel.presenter
        self.interactor = viewModel.interactor
        super.init(nibName: nil, bundle: nil)
        self.presenter?.mainView = self
        self.mainView.dataSource = viewModel.dataSource
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

extension MoviesViewController: UICollectionViewDelegate, UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.interactor?.getMovieResume(index: indexPath)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //FAKE infinite scroll
        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
            self.interactor?.fetchUpcomingMovies()
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = ((collectionView.bounds.size.width/2) - 10)
        let height: CGFloat = 320
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
