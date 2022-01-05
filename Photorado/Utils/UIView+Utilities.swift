//
//  UIView+Utilities.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import UIKit

extension UIView {
    
    // For insert layer in Foreground
    func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: frame.height * 0.65, width: frame.width, height: frame.height * 0.35)
        gradient.colors = colors.map{$0.cgColor}
        self.layer.addSublayer(gradient)
    }
    
    // For insert layer in background
    func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
        let gradient = CAGradientLayer()
        gradient.frame = frame
        gradient.colors = colors.map{$0.cgColor}
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}

