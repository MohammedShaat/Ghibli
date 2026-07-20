//
//  FilmDetailView.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import SwiftUI

struct FilmDetailScreen: View {
    @State private var viewModel: FilmDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                FilmImageView(urlString: viewModel.film.movieBanner)
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text(viewModel.film.title)
                            .font(.title)
                        
                        HStack {
                            Text(viewModel.film.originalTitle)
                            
                            Text(viewModel.film.originalTitleRomanised)
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
                            Text(viewModel.film.director)
                            Text(viewModel.film.producer)
                            Text(viewModel.film.releaseYear, format: .number)
                            Text(viewModel.film.duration, format: .number)
                            Text("\(viewModel.film.score)/100")
                        }
                    }
                    .padding(.top)
                    
                    Divider()
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Description")
                            .font(.headline)
                        
                        Text(viewModel.film.description)
                    }
                    .padding(.top)
                    
                    Group {
                        switch viewModel.state {
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
        .navigationTitle(viewModel.film.title)
        .task {
            await viewModel.getPeople()
        }
    }
    
    init(service: GhibliService, film: Film) {
        let viewModel = FilmDetailViewModel(service: service, film: film)
        _viewModel = State(initialValue: viewModel)
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
        FilmDetailScreen(service: service, film: film)
    }
}
