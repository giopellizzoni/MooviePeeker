//
//  MovieRequest.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

enum ImageSize: String {
    case small
    case medium
}

enum MovieRequest {
    case loadMovies
    case movieDetails(Int)
    case downloadPoster(String, ImageSize)
    
    var method: HTTPMethod {
        .GET
    }
    
    var endpoint: String {
        switch self {
        case .loadMovies:
            return Constants.baseURL.appending("/discover/movie")
        case .movieDetails(let id):
            return Constants.baseURL.appending("/movie/\(id)")
        case .downloadPoster(let poster, let imageSize):
            return Constants.baseDownloadPoster.appending("/\(getImageSize(imageSize))/\(poster)")
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

extension MovieRequest {
    private func getImageSize(_ imageSize: ImageSize) -> String {
        switch imageSize {
        case .small:
            return "w154"
        case .medium:
            return "w342"
        }
    }
}
