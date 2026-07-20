//
//  FilmListView.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import SwiftUI

struct FilmsListView: View {
    let films: [Film]
    
    var body: some View {
        List {
            ForEach(films) { film in
                NavigationLink(value: film) {
                    FilmView(film: film)
                }
            }
        }
        .navigationDestination(for: Film.self) { film in
            FilmDetailScreen(service: ApiGhibliService(), film: film)
        }
    }
}

#Preview {
    @State @Previewable var films: [Film]?
    let service = MockGhibliService()
    
    Task {
        films = try? await service.fetchFilms()
    }
    
    return VStack {
        if let films {
            FilmsListView(films: films)
        }
    }
}
