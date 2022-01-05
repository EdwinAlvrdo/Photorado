//
//  AlertManager.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import UIKit

class AlertManager {
    
    static let shared: AlertManager = AlertManager()
    
    private init() {}

    func showAlert(withMessage message: String, and title: String = "Hi!", withHandler handler: ((UIAlertAction) -> Void)? = nil) {
        guard let topVC = UIApplication.topViewController() else { return }
        
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: handler)
        
        alertController.addAction(okAction)
        
        DispatchQueue.main.async {
            topVC.present(alertController, animated: true, completion: nil)
        }
    }
}
