//
//  HTTPClient.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

typealias AsyncResponse = (data: Data, response: URLResponse)

protocol HTTPClient: AnyObject {
    func load(from url: URLRequest?) async throws -> AsyncResponse
}
