//
//  NetworkClient.swift
//  MoviePeeker
//
//  Created by Giovanni  Pellizzoni on 14/11/23.
//

import Foundation

public typealias AsyncResult = (data: Data, response: URLResponse)

public protocol NetworkClient: AnyObject {
    func load(from url: URLRequest?) async throws -> AsyncResult
}
