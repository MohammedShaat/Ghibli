//
//  FilmDetailView.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import SwiftUI

struct FilmDetailScreen: View {
    let film: Film
    let favoritesViewModel: FavoritesViewModel
    
    @State private var filmDetailVM: FilmDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                FilmImageView(urlString: film.movieBanner)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(film.title)
                            .font(.title)
                        
                        HStack {
                            Text(film.originalTitle)
                            
                            Text(film.originalTitleRomanised)
                        }
                        .foregroundStyle(.secondary)
                    }
                    .padding(.top)
                    
                    HStack(spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("Director")
                            Text("Producer")
                            Text("Release Date")
                            Text("Running Time")
                            Text("Score")
                        }
                        .fontWeight(.semibold)
                        
                        VStack(alignment: .leading) {
                            Text(film.director)
                            Text(film.producer)
                            Text(film.releaseYear, format: .number)
                            Text(film.duration, format: .number)
                            Text("\(film.score)/100")
                        }
                    }
                    .padding(.top)
                    
                    Divider()
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.headline)
                        
                        Text(film.description)
                    }
                    .padding(.top)
                    
                    Group {
                        switch filmDetailVM.state {
                        case .idle:
                            EmptyView()
                        case .loading:
                            ProgressView {
                                Text("Loading characters...")
                            }
                        case .loaded(let people):
                            peopleView(people)
                        case .failed(let error):
                            Text("Failed to load characters:\n\(error)")
                                .foregroundStyle(.red)
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
        }
        .navigationTitle(film.title)
        .task {
            await filmDetailVM.getPeople()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                FavoriteButtonView(filmId: film.id, favoritesViewModel: favoritesViewModel)
            }
        }
    }
    
    init(service: GhibliService, film: Film, favoritesViewModel: FavoritesViewModel) {
        self.film = film
        let filmDetailVM = FilmDetailViewModel(service: service, people: film.people)
        _filmDetailVM = State(initialValue: filmDetailVM)
        self.favoritesViewModel = favoritesViewModel
    }
    
    func peopleView(_ people: [Person]) -> some View {
        let lastPerson = people.last
        
        return VStack(alignment: .leading) {
            Text("Characters")
                .font(.headline)
                .padding(.top)
            
            ForEach(people) { person in
                VStack(alignment: .leading, spacing: 10) {
                    Text(person.name)
                    
                    HStack {
                        HStack {
                            Image(systemName: "person.fill")
                            Text(person.gender)
                            
                            Text("Age: \(person.age)")
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "eye")
                            Text(person.eyeColor)
                            
                            Text("Hair: \(person.hairColor)")
                        }
                    }
                    .font(.caption)
                    .foregroundStyle(.secondary)
                }
                .padding(.vertical, 10)
                
                if let lastPerson, person != lastPerson {
                    Divider()
                }
            }
        }
        .padding(.horizontal)
        .background(.gray.opacity(0.2))
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    let service = MockGhibliService()
    let film = service.fetchFilm()
    
    NavigationStack {
        FilmDetailScreen(service: service, film: film, favoritesViewModel: .sample)
    }
}
