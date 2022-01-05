//
//  Loader.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import UIKit
import SnapKit

class Loader {
    
    static let shared: Loader = Loader()

    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
        
    private init () {}
    
    open func show() {
        let view = UIApplication.topViewController()?.view
        
        containerView.frame = CGRect(x: 0, y: 0, width: view!.frame.width, height: view!.frame.height)
        containerView.backgroundColor = ResourceManager.shared.pallete.black.withAlphaComponent(0.7)
        
        progressView.frame = CGRect(x: (containerView.frame.width / 2) - 40,
                                    y: (containerView.frame.height / 2) - 40,
                                    width: 80,
                                    height: 80)

        progressView.backgroundColor = ResourceManager.shared.pallete.gray
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .large
        activityIndicator.center = CGPoint(x: progressView.bounds.width / 2, y: progressView.bounds.height / 2)
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view!.addSubview(containerView)
        
        activityIndicator.startAnimating()
    }
    
    open func dismiss() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}
