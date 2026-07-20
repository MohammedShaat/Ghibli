//
//  FavoritesScreen.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct FavoritesScreen: View {
    let filmsViewModel: FilmsViewModel
    let favoritesViewModel: FavoritesViewModel
    
    var films: [Film] {
        var allFilms = [Film]()
        if case .loaded(let films) = filmsViewModel.state {
            allFilms = films
        }
        let favoriteFilms = allFilms.filter { favoritesViewModel.isFavorite($0.id) }
        return favoriteFilms
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if films.isEmpty {
                    ContentUnavailableView("No favorites yet", systemImage: "heart.fill")
                } else {
                    FilmsListView(films: films, favoritesViewModel: favoritesViewModel)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    let filmsViewModel = FilmsViewModel.sample
    
    FavoritesScreen(filmsViewModel: filmsViewModel, favoritesViewModel: .sample)
        .task {
            await filmsViewModel.getFilms()
        }
}
