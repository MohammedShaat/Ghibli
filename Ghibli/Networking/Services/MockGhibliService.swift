//
//  MockGhibliService.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import Foundation

struct MockGhibliService: GhibliService {
    private struct SampleData: Decodable {
        let films: [Film]
        let people: [Person]
    }
    
    private func fetchSampleData() throws -> SampleData {
        guard let url = Bundle.main.url(forResource: "SampleData", withExtension: "json") else {
            throw APIError.invalidURL
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SampleData.self, from: data)
        } catch let error as DecodingError {
            print("DecodingError: ", error)
            throw APIError.decodingError(error)
        } catch let error as CocoaError {
            print("URLError: ", error)
            throw APIError.networkError(error)
        }
    }
    
    func fetchFilms() async throws -> [Film] {
        try fetchSampleData().films
    }
    
    func fetchPerson(of id: String) async throws -> Person {
        try fetchSampleData().people.randomElement()!
    }
    
    //MARK: Just for Preview
    func fetchFilm() -> Film {
        try! fetchSampleData().films.randomElement()!
    }
}
