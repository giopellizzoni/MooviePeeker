//
//  NetworkService.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation


public enum NetworkError: Error {
    case invalidRequest
    case networkError
}

class NetworkService: NetworkClient {
    
    private let session: URLSession!
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func load(from request: URLRequest?) async throws -> AsyncResult {
        guard let request = request else { throw NetworkError.invalidRequest }
        return try await session.data(for: request)
    }
    
}
