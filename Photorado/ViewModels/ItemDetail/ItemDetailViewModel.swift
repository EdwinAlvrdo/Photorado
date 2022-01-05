//
//  ItemDetailViewModel.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import UIKit

protocol ItemDetailProtocol: BaseMVVMProtocol {
    func didLoadView()
}

class ItemDetailViewModel {
    
    weak var view: ItemDetailProtocol!
    var router: ItemDetailRouter!

    var model: Item? {
        didSet {
            guard view != nil else {return}
            self.view.didLoadView()
        }
    }
    
    func loadView(){
        //Try fetch config values and initial data for application
        // .
        // .
        // .
        // data loaded
        view.didLoadView()
    }
        
    

    
}

// MARK: - Getters and setters for model
extension ItemDetailViewModel {
    func getItemTitle() -> String {
        return model?.title ?? "No Title"
    }
    
    func getItemDescription() -> String {
        return model?.tags ?? "No description"
    }
    
    func getItemImageUrl() -> URL? {
        guard let mMedia = model?.media, let url = mMedia.m else {
            return nil
        }
        return URL(string: url)
    }
    
}
