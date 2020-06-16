//
//  MoviesDataSource.swift
//  VIP
//
//  Created by ITAU on 15-06-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MoviesDataSource: NSObject {

    private var movies: [MovieResume]

    override init() {
        movies = []
    }

    public func append(moviesNews: [MovieResume]) {
        movies.append(contentsOf: moviesNews)
    }

    public func getMovie(idMovie: Int) -> MovieResume? {
        movies.filter { $0.id == idMovie }.first
    }

    public func getMovie(row: Int) -> MovieResume? {
        movies[row]
    }

}

extension MoviesDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CEll", for: indexPath)
        return cell
    }
}
