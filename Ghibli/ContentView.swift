//
//  ContentView.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import SwiftUI

struct ContentView: View {
    let service: GhibliService
    @State private var filmsVM: FilmsViewModel
    @State private var favoritesVM: FavoritesViewModel
    
    var body: some View {
        TabView {
            Tab("Films", systemImage: "movieclapper") {
                FilmsScreen(filmsviewModel: filmsVM, favoritesviewModel: favoritesVM)
            }
            
            Tab("Favorites", systemImage: "heart.fill") {
                FavoritesScreen(filmsViewModel: filmsVM, favoritesViewModel: favoritesVM)
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsScreen()
            }
            
            Tab(role: .search) {
                SearchScreen(service: service, favoritesViewModel: favoritesVM)
            }
        }
        .task {
            favoritesVM.load()
            await filmsVM.getFilms()
        }
    }
    
    init(
        service: GhibliService = ApiGhibliService(),
        storage: FavoritesStorage = UserDefaultsFavoritesStorage()
    ) {
        self.service = service
        let filmsVM = FilmsViewModel(service: service)
        _filmsVM = State(initialValue: filmsVM)
        
        let favoritesVM = FavoritesViewModel(storage: storage)
        _favoritesVM = State(initialValue: favoritesVM)
    }
}

#Preview {
    ContentView(service: MockGhibliService(), storage: MockFavoritesStorage())
}
