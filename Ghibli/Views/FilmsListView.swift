//
//  FilmListView.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import SwiftUI

struct FilmsListView: View {
    @State private var viewModel: FilmsViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .idle:
                    Text("No films yet")
                case .loading:
                    ProgressView {
                        Text("Loading filsm...")
                    }
                case .loaded(let films):
                    filmsList(films)
                case .failed(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
            .task {
                await viewModel.getFilms()
            }
        }
    }
    
    init(service: GhibliService) {
        let viewModel = FilmsViewModel(service: service)
        _viewModel = State(initialValue: viewModel)
    }
    
    private func filmsList(_ films: [Film]) -> some View {
        List {
            ForEach(films) { film in
                HStack {
                    AsyncImage(url: URL(string: film.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    .containerRelativeFrame(.horizontal, alignment: .leading) { width, _ in
                        width * 0.3
                    }

                    VStack(alignment: .leading) {
                        HStack {
                            Text(film.title)
                                .font(.headline)
                            Spacer()
                            Image(systemName: "heart")
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
    }
}

#Preview {
    FilmsListView(service: MockGhibliService())
}
