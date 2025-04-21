//
//  NetworkError.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import Foundation

enum QuoteServiceError: Error, LocalizedError {
    case invalidURL
    case requestFailed
    case decodingError

    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL."
        case .requestFailed: return "Request failed"
        case .decodingError: return "Decoding Error"
        }
    }
}

