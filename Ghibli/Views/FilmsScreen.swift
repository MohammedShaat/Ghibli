//
//  FilmsScreen.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import SwiftUI

struct FilmsScreen: View {
    let viewModel: FilmsViewModel
    
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
                    FilmsListView(films: films)
                case .failed(let error):
                    Text(error)
                        .foregroundStyle(.red)
                }
            }
                .navigationTitle("Ghibli Films")
        }
        .task {
            await viewModel.getFilms()
        }
    }
}

#Preview {
    let service = MockGhibliService()
    let vm = FilmsViewModel(service: service)
    
    FilmsScreen(viewModel: vm)
}
