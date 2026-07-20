//
//  Array+RandomElements.swift
//  Ghibli
//
//  Created by Mohammed on 7/20/26.
//

import Foundation

extension Array where Element: Equatable {
    func randomElements(count: Int) -> [Element] {
        var newElements = [Element]()
        while newElements.count < count && count <= self.count {
            if let randomElement = self.randomElement(),
               !newElements.contains(where: { randomElement == $0 })
            {
                newElements.append(randomElement)
            }
        }
        return newElements
    }
}
