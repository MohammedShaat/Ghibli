//
//  FilmViewModel+Sample.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

extension FilmsViewModel {
    static let sample = FilmsViewModel(service: MockGhibliService())
    
}

extension FavoritesViewModel {
    static let sample = FavoritesViewModel(storage: MockFavoritesStorage())
}
