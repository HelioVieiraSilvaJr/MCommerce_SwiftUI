//
//  Network.swift
//  MCommerce_SwiftUI
//
//  Created by Helio Junior on 27/09/22.
//

import Foundation

let URL_BASE = "192.168.15.3"

class Network: HTTPProtocol {
    private var requestTask: URLSessionDataTaskProtocol?
    private var session: URLSessionProtocol
    private var config: URLSessionConfiguration = {
        let config = URLSessionConfiguration()
        return config
    }()
    var host: String = ""

    init(session: URLSessionProtocol = URLSession.shared,
         requestTask: URLSessionDataTaskProtocol? = nil, customHost: String? = nil) {
        self.session = session
        self.requestTask = requestTask
        host = URL_BASE
        if let customHost = customHost {
            host = customHost
        }
    }

    func request<Model: Decodable>(method: HTTPMethod,
                                   path: String,
                                   model: Model.Type?,
                                   params: [String:Any]?,
                                   headers: [String:String]?,
                                   scheme: String = "http",
                                   completion: @escaping (ResponseResult<Model?>) -> Void) {
        guard let service = RequestBuilder.buildFrom(method: method,
                                                 path: path,
                                                 params: params,
                                                 customHeaders: headers,
                                                 scheme: scheme,
                                                 host: host) else {
            completion(.error(.invalidURL))
            return
        }
        
        guard ConnectionCheck.isConnectedToNetwork() else {
            completion(.error(.noInternet))
            return
        }
        
        requestTask = session.dataTask(with: service, completionHandler: { (data, response, error) in
            do {
                guard let data = data, let response = response as? HTTPURLResponse else {
                    completion(.error(.noData))
                    return
                }

                try ErrorResponseBuilder.build(from: response, error: error, data: data)

                if response.statusCode == 204 {
                    completion(.success(nil))
                    return
                }
                
                let object = try HTTPDecodeBuilder.build(from: data,
                                                         objectType: Model.self)

                completion(.success(object))
                self.prettyPrint(service: service, data: data)
            } catch {
                let error = error as! NetworkError
                completion(.error(error))
                self.prettyPrint(service: service, data: nil)
            }
        })
        requestTask?.resume()
    }

    private func prettyPrint(service: URLRequest, data: Data?) {
        
        debugPrint("")
        debugPrint("")
        debugPrint("######### REQUEST ###########")
        debugPrint("URL: \(service.url?.absoluteString ?? "")")
        let httpMethod = service.httpMethod
        debugPrint("Method: \(service.httpMethod ?? "")")

        debugPrint("Headers: \(String(describing: service.allHTTPHeaderFields))")
        
        if let httpMethod = httpMethod, httpMethod == "POST" || httpMethod == "PATCH" {
            debugPrint("BODY: \(service.httpBody)")
        }
        if let httpBody = service.httpBody {
            debugPrint("BODY: \(httpBody)")
        }
        
        guard let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: []) else { return }
        debugPrint("Reponse:")
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        debugPrint(String(data: jsonData, encoding: .utf8) ?? "")
        debugPrint("#################################")
    }

    func cancel(completion: (() -> Void)?) {
        requestTask?.cancel()
        URLSession.shared.getAllTasks { tasks in
            if tasks.count > 0 {
                _ = tasks.map { $0.cancel() }
            }
            completion?()
        }
    }
}
