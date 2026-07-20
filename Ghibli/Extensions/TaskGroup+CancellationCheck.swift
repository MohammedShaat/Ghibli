//
//  Task.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import Foundation

extension ThrowingTaskGroup {
    func checkCancellation() throws {
        if self.isCancelled {
            throw APIError.networkError(URLError(.cancelled))
        }
    }
}
