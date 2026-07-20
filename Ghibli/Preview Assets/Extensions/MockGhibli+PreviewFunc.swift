//
//  MockGhibli+PreviewFunc.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

extension MockGhibliService {
    //MARK: For Preview
    func fetchPreviewFilms() -> [Film] {
        Film.samples
    }
    
    //MARK: For Preview
    func fetchPreviewFilm() -> Film {
        Film.samples.randomElement()!
    }
}
