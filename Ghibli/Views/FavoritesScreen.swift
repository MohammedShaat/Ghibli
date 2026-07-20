//
//  FavoritesScreen.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct FavoritesScreen: View {
    let viewModel: FilmsViewModel
    
    var films: [Film] {
        []
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if films.isEmpty {
                    ContentUnavailableView("No favorites yet", systemImage: "heart.fill")
                } else {
                    FilmsListView(films: films)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    let service = MockGhibliService()
    let vm = FilmsViewModel(service: service)
    
    FavoritesScreen(viewModel: vm)
}
