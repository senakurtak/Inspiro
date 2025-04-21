//
//  Quote.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import Foundation

struct ZenQuote: Codable {
    let q: String   // Quote
    let a: String   // Author

    var content: String { q }
    var author: String { a }
}
