//
//  MockFavoritesStorage.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

struct MockFavoritesStorage: FavoritesStorage {
    func load() -> Set<String> {
        let filmsArray = Film.samples.randomElements(count: 2).map(\.id)
        return Set(filmsArray)
    }
    
    func save(ids: Set<String>) {
        
    }
}
