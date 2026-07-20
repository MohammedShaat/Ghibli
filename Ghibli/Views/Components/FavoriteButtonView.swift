//
//  FavoriteButtonView.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct FavoriteButtonView: View {
    let filmId: String
    let favoritesViewModel: FavoritesViewModel
    
    var body: some View {
        Button {
            favoritesViewModel.toggle(filmId)
        } label: {
            if favoritesViewModel.isFavorite(filmId) {
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            } else {
                Image(systemName: "heart")
            }
        }
    }
}

#Preview {
    let film = MockGhibliService().fetchFilm()
    
    VStack {
        FavoriteButtonView(filmId: film.id, favoritesViewModel: .sample)
        
        FavoriteButtonView(filmId: film.id, favoritesViewModel: .sample)
    }
}
