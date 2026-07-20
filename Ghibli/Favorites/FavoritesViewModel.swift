//
//  FavoritesViewModel.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

@Observable
class FavoritesViewModel {
    private var favoriteIds: Set<String> = []
    private let storage: FavoritesStorage
    
    init(storage: FavoritesStorage) {
        self.storage = storage
    }
    
    func load() {
        favoriteIds = storage.load()
    }
    
    private func save() {
        storage.save(ids: favoriteIds)
    }
    
    func toggle(_ id: String) {
        if isFavorite(id) {
            favoriteIds.remove(id)
        } else {
            favoriteIds.insert(id)
        }
        save()
    }
    
    func isFavorite(_ id: String) -> Bool {
        favoriteIds.contains(id)
    }
}
