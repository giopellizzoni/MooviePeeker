//
//  MovieRequest.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

enum MovieRequest {
    case loadMovies
    case movieDetails(Int)
    case downloadPoster(String)
    
    var method: HTTPMethod {
        .GET
    }
    
    var endpoint: String {
        switch self {
        case .loadMovies:
            return Constants.baseURL.appending("/discover/movie")
        case .movieDetails(let id):
            return Constants.baseURL.appending("/movie/\(id)")
        case .downloadPoster(let poster):
            return Constants.baseDownloadPoster.appending("/w154/\(poster)")
        }
    }
    
    var parameters: [URLQueryItem] {
        [URLQueryItem(name: "api_key", value: Constants.apiKey)]
    }
    
}

extension MovieRequest {
    func asURLRequest() -> URLRequest? {
        guard let url = URL(string: endpoint)?.appending(queryItems: parameters) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
