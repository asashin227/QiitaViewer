//
//  Request.swift
//  QiitaRepository
//
//  Created by Asakura  Shinsuke on 2020/02/27.
//  Copyright © 2020 Asakura  Shinsuke. All rights reserved.
//

import Alamofire

public enum HTTPMethod {
    case GET
    case POST
    case PUT
    case DELETE
}

public protocol Request {
    associatedtype ResultType
    var path: String { get }
    var method: HTTPMethod { get }
    
    func result(from object: Data) throws -> Self.ResultType
}


public extension Request {
    private var baseUrl : String {
        return "https://qiita.com"
    }
    
    private var url: String {
        return baseUrl + path
    }
    
    func start(finished: @escaping (Result<ResultType, Error>)->Void) {
        // TODO: Http Methodの使い分け未実装
        AF.request(url)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseJSON {response in
                if let responceData = response.data {
                    do {
                        let result = try self.result(from: responceData)
                        finished(Result.success(result))
                    } catch {
                        finished(Result.failure(error))
                    }
                } else if let error = response.error {
                    finished(Result.failure(error))
                }
        }
    }
}

extension Request where ResultType: Codable {
    public func result(from object: Data) throws -> Self.ResultType {
        return try JSONDecoder().decode(ResultType.self, from: object)
    }
}
