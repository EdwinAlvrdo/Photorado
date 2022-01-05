//
//  ItemDetailRouter.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation

class ItemDetailRouter {
    weak var viewController: ItemDetailVC!
    
    ///Use to pass data betweens controllers and get instances
    static func getViewController(with item: Item?) -> ItemDetailVC {
        
        let viewController = ItemDetailVC.instantiateViewController()
        let router = ItemDetailRouter()
        let viewModel = ItemDetailViewModel()
        
        viewController.vm = viewModel
        viewController.vm.model = item
        
        viewModel.router = router
        
        viewModel.view = viewController
        
        router.viewController = viewController
    
        return viewController
    }
        
    func goBack(){
        //Avoid crash
        guard viewController != nil else {return}
        viewController.navigationController?.popViewController(animated: true)
    }
}
