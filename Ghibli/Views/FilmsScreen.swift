//
//  FilmsScreen.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct FilmsScreen: View {
    let filmsviewModel: FilmsViewModel
    let favoritesviewModel: FavoritesViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                switch filmsviewModel.state {
                case .idle:
                    Text("No films yet")
                case .loading:
                    ProgressView {
                        Text("Loading filsm...")
                    }
                case .loaded(let films):
                    FilmsListView(films: films, favoritesViewModel: favoritesviewModel)
                case .failed(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
                .navigationTitle("Ghibli Films")
        }
    }
}

#Preview {
    FilmsScreen(filmsviewModel: .sample, favoritesviewModel: .sample)
}
