//
//  FilmListView.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import SwiftUI

struct FilmsListView: View {
    let films: [Film]
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        List {
            ForEach(films) { film in
                NavigationLink(value: film) {
                    FilmItemView(film: film, favoritesViewModel: favoritesViewModel)
                }
            }
        }
        .navigationDestination(for: Film.self) { film in
            FilmDetailScreen(
                service: ApiGhibliService(),
                film: film,
                favoritesViewModel: favoritesViewModel
            )
        }
    }
}

#Preview {
    let films = MockGhibliService().fetchPreviewFilms()
    
    return FilmsListView(films: films, favoritesViewModel: .sample)
}
