//
//  UIViewControllerExtension.swift
//  Photorado
//
//  Created by Edwin Alvarado on 1/5/22.
//

import Foundation
import UIKit

extension UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
