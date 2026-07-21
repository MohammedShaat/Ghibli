//
//  SearchScreen.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct SearchScreen: View {
    let favoritesViewModel: FavoritesViewModel
    @State private var searchViewModel: SearchViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                switch searchViewModel.state {
                case .idle:
                    ContentUnavailableView(
                        "Wanna search?", systemImage: "magnifyingglass", description: Text("Type your favorite movie to search for")
                    )
                case .loading:
                    ProgressView {
                        Text("Fetching search results...")
                    }
                case .loaded(let films):
                    if films.isEmpty {
                        ContentUnavailableView(
                            "No Results for \(searchViewModel.searchText)",
                            systemImage: "exclamationmark.magnifyingglass",
                            description: Text("Check your search query and try again")
                        )
                    } else {
                        FilmsListView(films: films, favoritesViewModel: favoritesViewModel)
                    }
                case .failed(let string):
                    Text(string)
                        .foregroundStyle(.red)
                }
            }
            .searchable(text: $searchViewModel.searchText)
            .task(id: searchViewModel.searchText) {
                await searchViewModel.search()
            }
        }
    }
    
    init(service: GhibliService, favoritesViewModel: FavoritesViewModel) {
        let searchVM = SearchViewModel(service: service)
        _searchViewModel = State(initialValue: searchVM)
        self.favoritesViewModel = favoritesViewModel
    }
}

#Preview {
    SearchScreen(service: MockGhibliService(), favoritesViewModel: .sample)
}
