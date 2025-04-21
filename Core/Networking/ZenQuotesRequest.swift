//
//  ZenQuotesRequest.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import Foundation

struct ZenQuotesRequest: Request {
    typealias Response = [ZenQuote]

    var urlRequest: URLRequest {
        let url = URL(string: "https://zenquotes.io/api/quotes")!
        return URLRequest(url: url)
    }
}
