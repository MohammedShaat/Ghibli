//
//  FavoritesStorage.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

protocol FavoritesStorage {
    func load() -> Set<String>
    
    func save(ids: Set<String>)
}
