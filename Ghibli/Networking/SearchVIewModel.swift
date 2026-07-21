//
//  SearchVIewModel.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

@Observable
class SearchViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case failed(String)
    }
    
    private let service: GhibliService
    var searchText = ""
    private(set) var state: State = .idle
    private var priorSearchText = ""
    
    init(service: GhibliService) {
        self.service = service
    }
    
    func search() async {
        guard !searchText.isEmpty, searchText != priorSearchText else { return }
        
        try? await Task.sleep(for: .seconds(0.5))
        
        do {
            try Task.checkCancellation()
            
            state = .loading
            let films = try await service.searchFilms(with: searchText)
            state = .loaded(films)
            
            priorSearchText = searchText
        } catch _ as CancellationError {
            // Ignore Task Cancellation error
            state = .idle
        } catch APIError.networkError(let error) {
            // Ignore Network Cancellation error
            if error.code == .cancelled {
                state = .idle
            } else {
                state = .failed(error.localizedDescription)
            }
        } catch let error as APIError {
            state = .failed(error.errorDescription ?? error.localizedDescription)
        } catch {
            state = .failed(error.localizedDescription)
        }
    }
}
