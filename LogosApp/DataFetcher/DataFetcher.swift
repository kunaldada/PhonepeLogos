//
//  DataFetcher.swift
//  GoJekContacts
//
//  Created by ioshellboy on 06/07/19.
//  Copyright © 2019 ioshellboy. All rights reserved.
//

import UIKit

enum DataRequestType {
    case get
    
    var getAssociatedString: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

protocol DataRequestorProtocol {
    var urlString: String? {get set}
    var dataRequestType: DataRequestType {get set}
    var appendedParameters: [String: Any]? {get set}
}

protocol DataFetcherProtocol {
    func fetchData<T: Codable>(dataRequestor: DataRequestorProtocol, success: ((_ response: T?) -> (Void))?, failure: ((_ error: Error?) -> (Void))?)
    func fetchImage(dataRequestor: DataRequestorProtocol, success: ((_ response: UIImage?, _ requestUrlStr: String?) -> (Void))?, failure: ((_ error: Error?) -> (Void))?)
}

final class DataFetcher: DataFetcherProtocol {
    
    static let shared = DataFetcher()
    
    private init() {
        
    }
    
    private let apiConnection = APIConnection()
    
    internal func fetchData<T: Codable>(dataRequestor: DataRequestorProtocol, success: ((_ response: T?) -> (Void))?, failure: ((_ error: Error?) -> (Void))?) {
        apiConnection.makeConnection(dataRequestor: dataRequestor) { (data, error, statusCode) -> (Void) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(T.self, from: data)
                    success?(decodedResponse)
                }
                catch{
                    failure?(error)
                }
            }
            else if let error = error {
                failure?(error)
            }
            else {
                failure?(nil)
            }
        }
        
    }
    
    internal func fetchImage(dataRequestor: DataRequestorProtocol, success: ((_ response: UIImage?, _ requestUrlStr: String?) -> (Void))?, failure: ((_ error: Error?) -> (Void))?) {
        
        apiConnection.makeImageConnection(dataRequestor: dataRequestor) { (image, requestUrlString, error, statusCode) -> (Void) in
            if let image = image {
                success?(image, requestUrlString)
            }
            else if let error = error {
                failure?(error)
            }
            else {
                failure?(nil)
            }
        }
        
    }
}
