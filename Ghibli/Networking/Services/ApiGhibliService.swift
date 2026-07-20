//
//  ApiGhibliService.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import Foundation

struct ApiGhibliService: GhibliService {
    
    private func fetch<T: Decodable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("BadResponse: ", response)
                throw APIError.badResponse
            }
            
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            print("DecodingError: ", error)
            throw APIError.decodingError(error)
        } catch let error as URLError {
            print("URLError: ", error)
            throw APIError.networkError(error)
        }
    }
    
    func fetchFilms() async throws -> [Film] {
        try await fetch(from: "https://ghibliapi.vercel.app/films")
    }
    
    func fetchPerson(of urlString: String) async throws -> Person {
        try await fetch(from: urlString)
    }
}
