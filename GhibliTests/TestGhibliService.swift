//
//  TestGhibliService.swift
//  GhibliTests
//
//  Created by Mohammed on 7/21/26.
//

import Foundation
@testable import Ghibli

@MainActor
struct TestGhibliService: GhibliService {
    let duration: Duration
    
    init(duration: Duration = .zero) {
        self.duration = duration
    }
    
    func fetchFilms() async throws -> [Film] {
        Film.samples
    }
    
    func fetchPerson(of id: String) async throws -> Person {
        Person(id: "1", name: "Test", gender: "male", age: 18, eyeColor: "blue", hairColor: "brown", films: [], species: "", url: "")
    }
    
    func searchFilms(with query: String) async throws -> [Film] {
        try? await Task.sleep(for: duration)
        
        let allFilms = try await fetchFilms()
        let matchedFilms = allFilms.filter { $0.title.localizedStandardContains(query) }
        return matchedFilms
    }
    
    func fetchFilm() -> Film {
        Film.samples.randomElement()!
    }
}
