//
//  APIError.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//


import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case badResponse
    case decodingError(Error)
    case networkError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "The URL is invalid"
        case .badResponse:
            "Bad response from server"
        case .decodingError(let error):
            "Failed to decode response: \(error.localizedDescription)"
        case .networkError(let error):
            "Network error: \(error.localizedDescription)"
        }
    }
}