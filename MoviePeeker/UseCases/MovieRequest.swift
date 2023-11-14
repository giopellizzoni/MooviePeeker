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
    case downloadPoster
    
    var method: HTTPMethod {
        .GET
    }
    
    var path: String {
        switch self {
        case .loadMovies:
            return "/discover/movie"
        case .movieDetails(let id):
            return "movie/\(id)"
        case .downloadPoster:
            return ""
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .loadMovies:
            return [URLQueryItem(name: "api_key", value: Constants.apiKey)]
        default:
            return []
        }
    }
    
}

extension MovieRequest {
    func asURLRequest() -> URLRequest? {
        guard let url = URL(string: Constants.baseURL.appending(path))?.appending(queryItems: parameters) else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
}
