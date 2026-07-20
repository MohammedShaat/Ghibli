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
    
    var body: some View {
        TabView {
            Tab("Films", systemImage: "movieclapper") {
                FilmsScreen(viewModel: filmsVM)
            }
            
            Tab("Favorites", systemImage: "heart.fill") {
                FavoritesScreen(viewModel: filmsVM)
            }
            
            Tab("Settings", systemImage: "gear") {
                SettingsScreen()
            }
            
            Tab(role: .search) {
                SearchScreen()
            }
        }
    }
    
    init(service: GhibliService = ApiGhibliService()) {
        self.service = service
        let vm = FilmsViewModel(service: service)
        _filmsVM = State(initialValue: vm)
    }
}

#Preview {
    ContentView(service: MockGhibliService())
}
