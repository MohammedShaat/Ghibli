//
//  GhibliService.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import Foundation

protocol GhibliService: Sendable {
    func fetchFilms() async throws -> [Film]
    
    func fetchPerson(of urlString: String) async throws -> Person
}
