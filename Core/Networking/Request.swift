//
//  Request.swift
//  Inspiro
//
//  Created by Sena Kurtak on 22.04.2025.
//

import Foundation

protocol Request {
    associatedtype Response: Decodable
    var urlRequest: URLRequest { get }
}
