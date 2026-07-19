//
//  Film.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import Foundation
import Playgrounds

struct Film: Codable, Equatable, Identifiable {
    let id: String
    let title: String
    let image: String
    let movieBanner: String
    let description: String
    let director: String
    let producer: String
    let releaseYear: Int
    let duration: Int
    let score: Int
    let people: [String]
    let species: [String]
    let locations: [String]
    let vehicles: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, image, description, director, producer, people, species, locations, vehicles, url
        case releaseYear = "release_date"
        case movieBanner = "movie_banner"
        case duration = "running_time"
        case score = "rt_score"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        self.movieBanner = try container.decode(String.self, forKey: .movieBanner)
        self.description = try container.decode(String.self, forKey: .description)
        self.director = try container.decode(String.self, forKey: .director)
        self.producer = try container.decode(String.self, forKey: .producer)
        
        let releaseYearStr = try container.decode(String.self, forKey: .releaseYear)
        self.releaseYear = Int(releaseYearStr) ?? 0
        
        let durationStr = try container.decode(String.self, forKey: .duration)
        self.duration = Int(durationStr) ?? 0
        
        let scoreStr = try container.decode(String.self, forKey: .score)
        self.score = Int(scoreStr) ?? 0
        
        self.people = try container.decode([String].self, forKey: .people)
        self.species = try container.decode([String].self, forKey: .species)
        self.locations = try container.decode([String].self, forKey: .locations)
        self.vehicles = try container.decode([String].self, forKey: .vehicles)
        self.url = try container.decode(String.self, forKey: .url)
    }
}


#Playground {
    let url = URL(string: "https://ghibliapi.vercel.app/films")!
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let films = try JSONDecoder().decode([Film].self, from: data)
        print(films)
    } catch {
        print(error)
    }
}
