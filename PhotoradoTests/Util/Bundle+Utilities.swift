//
//  Bundle+.swift
//  PhotoradoTests
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
@testable import Photorado

extension Bundle {
    
    func decodeJSONFeeds(from filename: String) -> FeedsResponse? {
        guard let jsonPath = url(
            forResource: filename,
            withExtension: "json") else {
                fatalError("Failed to locate \(filename) in app bundle.")
        }

        guard let jsonData = try? Data(contentsOf: jsonPath) else {
            fatalError("Failed to load \(filename) from app bundle.")
        }
        
        do {
            let responseModel: FeedsResponse? = try JSONDecoder().decode(FeedsResponse.self, from: jsonData)
            return responseModel
        } catch {
            fatalError("Failed to decode FeedsResponse from \(filename) in app bundle.")
        }
    }
}
