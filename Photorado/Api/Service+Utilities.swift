//
//  Service+Utilities.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import Moya

class Services {
    
    enum internalResponse {
        case success(response: Moya.Response)
        case error(response: Moya.Response)
        case failure
        case redirect(response: Moya.Response)
    }
    
    open class func proccessResult(result: Result<Response, MoyaError>, manageError: Bool = false) -> internalResponse {
        
        switch result {
        case .success(let response): //Check response and return internalResponse
            #if DEBUG
            print(String(data: response.data, encoding: String.Encoding.utf8)!)
            #else
            #endif
            
            switch response.statusCode {
            case 100..<199: //1xx - Informational
                return internalResponse.success(response: response)
            case 200..<299: //2xx - Success
                return internalResponse.success(response: response)
            case 300..<399: //3xx - Redirect
                return internalResponse.redirect(response: response)
            case 400..<499: //4xx - Client Error
///               If error code needs to be catched to change behavior manage on each call
///               general error behavior is catched on proccessServiceError
                Services.proccessServiceError(response: response)
                return internalResponse.error(response: response)
            case 500..<599: //5xx - Server Error
///               If error code needs to be catched to change behavior manage on each call
///               general error behavior is catched on proccessServiceError
                Services.proccessServiceError(response: response)
                return internalResponse.error(response: response)
            default:
                return internalResponse.failure
            }
        case .failure(_):
            return internalResponse.failure
        }
    }
    
    ///#Manage Error:
    /// This property is used for show messgae to the user or not
    /// Ex. Services like player tracking dont need this manage cuz we dont wanna stop the user experience by an internal error maybe
    /// Ex. Services like post its needed this behavior cuz the user needs an interface update. If this change was success or not
    class func proccessServiceError(code: String? = "", response: Moya.Response? = Moya.Response(statusCode: 0, data: Data())) {}
       
    class func buildTypeDebug() -> Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
}
