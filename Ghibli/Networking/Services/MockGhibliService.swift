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
            throw StorageError.invalidURL
        }
        
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode(SampleData.self, from: data)
        } catch let error as DecodingError {
            print("DecodingError: ", error)
            throw StorageError.decodingError(error)
        } catch let error as CocoaError {
            print("URLError: ", error)
            throw StorageError.dataError(error)
        }
    }
    
    func fetchFilms() async throws -> [Film] {
//        try fetchSampleData().films
        
        //MARK: For Preview
        Film.samples
    }
    
    func fetchPerson(of id: String) async throws -> Person {
        try fetchSampleData().people.randomElement()!
    }
    
    func searchFilms(with query: String) async throws -> [Film] {
        let allFilms = try await fetchFilms()
        let matchedFilms = allFilms.filter { $0.title.localizedStandardContains(query) }
        return matchedFilms
    }
    
    //MARK: Just for Preview
    func fetchFilm() -> Film {
//        try! fetchSampleData().films.randomElement()!
        
        //MARK: For Preview
        Film.samples.randomElement()!
    }
}
