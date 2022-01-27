//
//  NetworkManager.swift
//  IM
//
//  Created by admin on 2022/1/27.
//

import Foundation
import Alamofire

private let baseUrl = ""
typealias NetworkRequestResult = Result<Data, Error>
typealias NetworkRequestCompletion = (NetworkRequestResult) -> Void

class NetworkManager{
    
    static let instance = NetworkManager()
    
    var commonHeaders: HTTPHeaders{ [] }
    
    private init() {}
    
    // GET 请求
    @discardableResult
    func requestGet(path: String, parameters: Parameters?, completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(baseUrl + path,
                   parameters: parameters,
                   headers: commonHeaders,
                   requestModifier: {$0.timeoutInterval = 30})
            .responseData{ response in
                switch response.result {
                case let .success(data): completion(.success(data))
                case let .failure(error): completion(self.handleError(error))
                }
            }
    }
    
    // POST 请求
    @discardableResult
    func requestPost(path: String, parameters: Parameters?, completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(baseUrl + path,
                   method: .post,
                   parameters: parameters,
                   encoding: JSONEncoding.prettyPrinted, // 把参数编码成JSON
                   headers: commonHeaders,
                   requestModifier: {$0.timeoutInterval = 30})
            .responseData{ response in
                switch response.result {
                case let .success(data): completion(.success(data))
                case let .failure(error): completion(self.handleError(error))
                }
            }
    }
    
    // PUT 请求
    @discardableResult
    func requestPut(path: String, parameters: Parameters?, completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(baseUrl + path,
                   method: .put,
                   parameters: parameters,
                   encoding: JSONEncoding.prettyPrinted, // 把参数编码成JSON
                   headers: commonHeaders,
                   requestModifier: {$0.timeoutInterval = 30})
            .responseData{ response in
                switch response.result {
                case let .success(data): completion(.success(data))
                case let .failure(error): completion(self.handleError(error))
                }
            }
    }
    
    // DELETE 请求
    @discardableResult
    func requestDelete(path: String, parameters: Parameters?, completion: @escaping NetworkRequestCompletion) -> DataRequest {
        AF.request(baseUrl + path,
                   method: .delete,
                   parameters: parameters,
                   headers: commonHeaders,
                   requestModifier: {$0.timeoutInterval = 30})
            .responseData{ response in
                switch response.result {
                case let .success(data): completion(.success(data))
                case let .failure(error): completion(self.handleError(error))
                }
            }
    }
    
    private func handleError(_ error: AFError) -> NetworkRequestResult {
        if let underlyingError = error.underlyingError {
            let nserror = underlyingError as NSError
            let code = nserror.code
            if  code == NSURLErrorNotConnectedToInternet ||
                code == NSURLErrorTimedOut ||
                code == NSURLErrorInternationalRoamingOff ||
                code == NSURLErrorDataNotAllowed ||
                code == NSURLErrorCannotFindHost ||
                code == NSURLErrorCannotConnectToHost ||
                code == NSURLErrorNetworkConnectionLost {
                var userInfo = nserror.userInfo
                userInfo[NSLocalizedDescriptionKey] = "网络连接异常"
                let currentError = NSError(domain: nserror.domain, code: code, userInfo: userInfo)
                return .failure(currentError)
            }
        }
        return .failure(error)
    }
}
