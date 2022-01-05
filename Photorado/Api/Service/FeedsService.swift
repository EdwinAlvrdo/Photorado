//
//  FeedService.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import Moya

internal let requestTags: String = "tags"
internal let requestFormat: String = "format"
internal let requestNoJsonCallback: String = "nojsoncallback"

enum FeedsService {
    case getPhotosPublic(tags:String, format:String, nojsoncallback: String)
}

//If we have auth just use AccessTokenAuthorizable and base provider
extension FeedsService: TargetType {
    var baseURL: URL {
        //TODO: Use a router manager for this
        return URL(string: "https://api.flickr.com/services/feeds")!
    }
    
    var path: String {
        return "/photos_public.gne"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPhotosPublic(let tags, let format, let nojsoncallback):
            return .requestParameters(
                parameters: [
                    requestTags: tags,
                    requestFormat: format,
                    requestNoJsonCallback: nojsoncallback
                ],
                encoding: URLEncoding.default)
        }
    }
    
    
    var headers: [String : String]? {
        return [:]
    }
}

//MARK: - Service Manager methods
extension FeedsService {
    //MARK: - CRUD Feed
    // Attempt get public photo feed
    static func attemptGetPublicPhotos(from tags: String? = "coloradomountains", callback: @escaping (_ result: FeedsResponse?)->()) {
        
        BaseProvider<FeedsService, FeedsResponse>
            .attemptCallService(
                target: FeedsService.getPhotosPublic(tags: tags!, format: "json", nojsoncallback: "1"),
                successHandler: { (response) in
                    callback(response)
                }) { (error) -> Void? in
                    callback(nil)
                }
    
    }
}
