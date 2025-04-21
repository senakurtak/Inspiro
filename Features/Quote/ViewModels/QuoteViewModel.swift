//
//  QuoteViewModel.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import Foundation

protocol QuoteViewModelDelegate: AnyObject {
    func didReceiveQuote(_ quote: ZenQuote)
    func didFailWithError(_ error: Error)
}

final class QuoteViewModel {
    weak var delegate: QuoteViewModelDelegate?
    private let networkClient: NetworkClient

    init(networkClient: NetworkClient = NetworkClient()) {
        self.networkClient = networkClient
    }

    func fetchQuote() {
        Task {
            do {
                let quotes = try await networkClient.send(ZenQuotesRequest())
                if let random = quotes.randomElement() {
                    DispatchQueue.main.async {
                        self.delegate?.didReceiveQuote(random)
                    }
                } else {
                    throw URLError(.cannotParseResponse)
                }
            } catch {
                DispatchQueue.main.async {
                    self.delegate?.didFailWithError(error)
                }
            }
        }
    }
}
