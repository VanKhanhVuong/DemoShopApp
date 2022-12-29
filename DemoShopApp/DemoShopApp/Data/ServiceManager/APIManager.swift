//
//  APIManager.swift
//  DemoShopApp
//
//  Created by Văn Khánh Vương on 29/12/2022.
//

import Foundation

protocol ApiClientProtocol {
    func request<T: Codable>(request: String, dataModel: T.Type) async -> Result<T, ErrorModel>
}

final class APIManager: ApiClientProtocol {
    static var shared = APIManager()
    private init() { }
}

extension APIManager {
    func sessionRequest(urlRequest: String) async throws -> Data {
        try await withUnsafeThrowingContinuation({ continuation in
                    // prepare json data
            let json: [String: Any] = ["user_code": "0902850001",
                                        "user_pass": "e10adc3949ba59abbe56e057f20f883e"]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
            
                    // create post request
                    let url = URL(string: urlRequest)!
                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.setValue("15", forHTTPHeaderField: "store_id")
                    request.setValue("vi", forHTTPHeaderField: "language")
            
                    // insert json data to the request
                    request.httpBody = jsonData
            
                    let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
                        guard let jSondata = data, error == nil else {
                            continuation.resume(throwing: error!)
                            return
                        }
                        continuation.resume(returning: jSondata)
                    }
                    task.resume()
        })
    }
    
    
    func request<T: Codable>(request: String, dataModel: T.Type) async -> Result<T, ErrorModel> {
        do {
            let decoder = JSONDecoder()
            let undecodedData = try await self.sessionRequest(urlRequest: request)
            let decodedData = try decoder.decode(T.self, from: undecodedData)
            return .success(decodedData)
        } catch {
            return .failure(ErrorModel.unknownError)
        }
    }
}
