//
//  Service.swift
//  TalalkApp
//
//  Created by Abel Molnar on 17/11/16.
//  Copyright © 2016 abel. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

enum ServiceType {
    
    case GetFoodRequest
   
    
}

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum HeaderField: String {
    case apiKey = "APIKey"
    case contentType = "Content-Type"
    case authorization = "Authorization"
}

public enum HeaderValue: String {
    case applicationJson = "application/json"
}

protocol ServiceDelegate: class {
    func initService()
    func serviceDataDownloadSuccess(type: ServiceType, data: AnyObject)
    func serviceDataDownloadFailed(type: ServiceType, errorCode: Int, errorMessage:String )
}


class Service {
    
    weak var delegate: ServiceDelegate!
    init(){}
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    

    func getFoodRequest() {
        var request = URLRequest(url: NSURL(string: "\(ServiceConst.getBaseUrl())?foo=bar")! as URL)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue(HeaderValue.applicationJson.rawValue, forHTTPHeaderField: HeaderField.contentType.rawValue)
        request.setValue("Bearer iwn-31@!3pf(w]pmarewj236^in", forHTTPHeaderField: HeaderField.authorization.rawValue)
       
        Alamofire.request(request)
            .validate(statusCode: 200..<300)
           // .validate(contentType: [HeaderValue.applicationJson.rawValue])
            .responseArray { (response: DataResponse<[GetFoodResponse]>) in
                switch response.result {
                case .failure(let error):
                    if let data = response.data, let responseString = String(data: data, encoding: .utf8) {
                        print("getuser_failuresponse: \(responseString)")
                        let dict = self.convertToDictionary(text: responseString)
                        if let errorMessage = dict?["message"] as? String{
                            self.delegate?.serviceDataDownloadFailed(type: ServiceType.GetFoodRequest, errorCode: -1, errorMessage: errorMessage)
                        }
                    }else {
                        self.delegate?.serviceDataDownloadFailed(type: ServiceType.GetFoodRequest, errorCode: -2, errorMessage: "\(error)")
                    }
                case .success(let responseObject):
                    print("responseobject: \(responseObject)")
                    self.delegate?.serviceDataDownloadSuccess(type: ServiceType.GetFoodRequest, data: response.result.value! as AnyObject)
                }
                
        }
        
    }
    
}
