//
//  MockError.swift
//  Ghibli
//
//  Created by Mohammed on 7/21/26.
//

import Foundation

enum StorageError: LocalizedError {
    case invalidURL
    case decodingError(DecodingError)
    case dataError(CocoaError)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "The URL is not found"
        case .decodingError(let error):
            "Failed to decode data: \(error.localizedDescription)"
        case .dataError(let error):
            "Data error: \(error.localizedDescription)"
        }
    }
}
