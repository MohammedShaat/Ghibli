//
//  FilmDetailViewModel.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import Foundation

@Observable
class FilmDetailViewModel {
    enum State: Equatable {
        case idle
        case loading
        case loaded([Person])
        case failed(String)
    }
    
    private let service: GhibliService
    let film: Film
    private(set) var state: State = .idle
    
    init(service: GhibliService, film: Film) {
        self.service = service
        self.film = film
    }
    
    func getPeople() async {
        guard state == .idle else {
            return
        }
        
        state = .loading
        
        do {
            let people = try await fetchPeople()
            state = .loaded(people)
        } catch let error as APIError {
            state = .failed(error.errorDescription ?? "Unknown Error")
        } catch {
            state = .failed("Unknown Error")
        }
    }
    
    private func fetchPeople() async throws -> [Person] {
        var people = [Person]()
        
        return try await withThrowingTaskGroup(of: Person.self) { group in
            for personUrlString in film.people {
                try group.checkCancellation()
                group.addTask {
                    print("Person")
                    return try await self.service.fetchPerson(of: personUrlString)
                }
            }
            
            for try await person in group {
                try group.checkCancellation()
                people.append(person)
            }
            
            return people
        }
    }
}
