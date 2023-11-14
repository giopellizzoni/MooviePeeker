//
//  NetworkService.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation


enum NetworkError: Error {
    case invalidRequest
}

class NetworkService: HTTPClient {
    
    private let session: URLSession!
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func load(from request: URLRequest?) async throws -> AsyncResponse {
        guard let request = request else { throw NetworkError.invalidRequest }
        return try await session.data(for: request)
    }
    
}
