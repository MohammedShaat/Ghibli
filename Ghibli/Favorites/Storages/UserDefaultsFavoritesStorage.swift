//
//  UserDefaultsFavoritesStorage.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

struct UserDefaultsFavoritesStorage: FavoritesStorage {
    private let key = "favorites"

    func load() -> Set<String> {
        guard let array =  UserDefaults.standard.stringArray(forKey: key) else {
            return []
        }
        return Set(array)
    }
    
    func save(ids: Set<String>) {
        UserDefaults.standard.set(Array(ids), forKey: key)
    }
}
