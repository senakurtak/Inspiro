//
//  NetworkClient.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import Foundation

final class NetworkClient {
    func send<T: Request>(_ request: T) async throws -> T.Response {
        let (data, response) = try await URLSession.shared.data(for: request.urlRequest)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.Response.self, from: data)
    }
}
