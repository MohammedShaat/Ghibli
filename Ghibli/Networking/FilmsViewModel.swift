//
//  FilmsViewModel.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case badResponse
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "The URL is invalid"
        case .badResponse:
            "Bad response from server"
        case .decodingError(let error):
            "Failed to decode response: \(error.localizedDescription)"
        case .networkError(let error):
            "Network error: \(error.localizedDescription)"
        }
    }
}

@Observable
class FilmsViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Film])
        case failed(String)
    }
    
    private(set) var state: State = .idle
    private let service: GhibliService
    
    init(service: GhibliService) {
        self.service = service
    }
    
    func getFilms() async {
        guard state == .idle else {
            return
        }
        
        state = .loading
        
        do {
            let films = try await service.fetchFilms()
            state = .loaded(films)
        } catch let error as APIError {
            state = .failed(error.errorDescription ?? "Unknown Error")
        } catch {
            state = .failed("Unknown Error")
        }
    }
}
