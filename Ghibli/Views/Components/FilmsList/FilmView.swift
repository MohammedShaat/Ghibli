//
//  FilmView.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import SwiftUI

struct FilmItemView: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        HStack {
            FilmImageView(urlString: film.image)
                .containerRelativeFrame(.horizontal, alignment: .center) { width, _ in
                    width * 0.3
                }
                .frame(height: 170)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(film.title)
                        .font(.headline)
                    Spacer()
                    
                    FavoriteButtonView(filmId: film.id, favoritesViewModel: favoritesViewModel)
                        .buttonStyle(.borderless)
                }
                
                VStack(alignment: .leading) {
                    Text("Directed by \(film.director)")
                    
                    Text("Release: \(film.releaseYear)")
                }
                .foregroundStyle(.secondary)
            }
            
        }
    }
}

#Preview {
    let service = MockGhibliService()
    let film = service.fetchFilm()
    let favoritesViewModel = FavoritesViewModel(storage: MockFavoritesStorage())
    
    NavigationStack {
        List {
            FilmItemView(film: film, favoritesViewModel: favoritesViewModel)
            
            FilmItemView(film: film, favoritesViewModel: favoritesViewModel)
        }
    }
}
