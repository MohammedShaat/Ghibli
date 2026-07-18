//
//  People.swift
//  Ghibli
//
//  Created by Mohammed on 7/18/26.
//

import Foundation
import Playgrounds

struct Person: Codable {
    let id: String
    let name: String
    let gender: String
    let age: Int
    let eyeColor: String
    let hairColor: String
    let films: [String]
    let species: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, gender, age, films, species, url
        case eyeColor = "eye_color"
        case hairColor = "hair_color"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.gender = try container.decode(String.self, forKey: .gender)
        let ageStr = try container.decode(String.self, forKey: .age)
        self.age = Int(ageStr) ?? 0
        self.films = try container.decode([String].self, forKey: .films)
        self.species = try container.decode(String.self, forKey: .species)
        self.url = try container.decode(String.self, forKey: .url)
        self.eyeColor = try container.decode(String.self, forKey: .eyeColor)
        self.hairColor = try container.decode(String.self, forKey: .hairColor)
    }
}

#Playground {
    let url = URL(string: "https://ghibliapi.vercel.app/people/598f7048-74ff-41e0-92ef-87dc1ad980a9")!
    
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        let person = try JSONDecoder().decode(Person.self, from: data)
        print(person)
    } catch {
        print(error)
    }
}
