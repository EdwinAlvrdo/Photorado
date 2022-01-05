//
//  ResourceManager.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import UIKit
import SwiftyGif

struct ResourceManager {
    
    static let shared = ResourceManager()
    
    var pallete: Pallete = Pallete()
    let icon: Icon = Icon()
    let images: Images = Images()
    let strings: Strings = Strings()
    
    private init() {}
}

//MARK: - PALLETE
extension ResourceManager {
    struct Pallete {
        let primary: UIColor = UIColor(named: "Primary")!
        let primaryTint: UIColor = UIColor(named: "PrimaryTint")!
        let secondary: UIColor = UIColor(named: "Secondary")!
        let background: UIColor = UIColor(named: "Background")!
        let backgroundTint: UIColor = UIColor(named: "BackgroundTint")!
        let black: UIColor = .black
        let white: UIColor = .white
        let gray: UIColor = .darkGray
        let clear: UIColor = .clear
    }
}

//MARK: - ASSETS
extension ResourceManager {
    struct Icon {
        let appIco: UIImage = UIImage(named: "AppIcon")!
        let search: UIImage = UIImage(named: "ic_search_black")!
        let shuffle: UIImage = UIImage(named: "ic_shuffle_black")!
    }
    
    struct Images {
        let appLogo: UIImage = UIImage(named: "AppIcon")!
        var splash: UIImage {
            do {
                return try UIImage(gifName: "mountain_splash")
            } catch {
                return ResourceManager.shared.images.appLogo
            }
        }
        var itemLoading: UIImage {
            do {
                return try UIImage(gifName: "skeleton_ios")
            } catch {
                return ResourceManager.shared.images.appLogo
            }
        }
        let itemPlaceHolder: UIImage = UIImage(named: "placeholder_item")!
    }
}

//MARK: - Strings
//TODO: Load this strings from localized :)
extension ResourceManager {
    struct Strings {
        let splashTitle: String = "Colorado Photos App"
        let loadingSplashTxt: String = "Finding mountains..."
        let serviceError: String = "Error fetching mountains, try again later"
        let feedTitle: String = "Colorado Mountains Feed"
    }
}
