//
//  BaseProvider.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//
import Foundation
import Moya
import Alamofire

class BaseProvider<T:TargetType, M: Codable> {
    
    /// Building provider
    ///
    /// Add plugins and build provider depending of the enviroment
    /// You can edit global session configuration  using this interceptor
    ///     ex. {provider}.session.sessionConfiguration.timeoutIntervalForRequest = 2 (2 seconds)
    func build() -> MoyaProvider<T> {
        //  MARK: Build Debug Mode
        #if DEBUG
        return MoyaProvider<T>(plugins: [
            NetworkLoggerPlugin(
                configuration: .init(
                    formatter: .init(),
                    output: { (target, array) in
                        if let log = array.first {
                            //Removing extra curl header to run in terminal faster
                            let encoding: String = "Accept-Encoding: br;q=1.0, gzip;q=0.9, deflate;q=0.8"
                            let trace: String = "-v"
                            print(log.replacingOccurrences(of: encoding, with: "").replacingOccurrences(of: trace, with: ""))
                        }
                    },
                    logOptions: .formatRequestAscURL)
            )]
        )
        #else
        //  MARK: - Build Release Mode
        return MoyaProvider<T>(plugins: [authPlugin])
        #endif
    }
    
//  MARK: - Generic call service
    static func attemptCallService(target: TargetType, successHandler: @escaping (_ result: M?) -> Void, errorHandler: @escaping (_ error: Response?) -> Void?) {
        
        Loader.shared.show()

        let provider = BaseProvider<T,M>().build()
        
        provider.request(target as! T) { (moyaResult) in
            //Error manager proccess
            let result: Services.internalResponse = Services.proccessResult(result: moyaResult)
            
            switch result {
            case .success(let response):
                do {
                    let responseModel: M? = try JSONDecoder().decode(M.self, from: response.data)
                    
                    if let mResponse = responseModel {
                        successHandler(mResponse)
                    }else{
                        errorHandler(nil)
                    }
                }catch{
                    errorHandler(nil)
                }
                break
            case .redirect(_): break
            case .error(_): //Manage general errors here
                errorHandler(nil) // TODO: return error parsed
                break
            case .failure:
                errorHandler(nil)
                break
            }
        }
    }
        
}
