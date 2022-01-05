//
//  FeedRouter.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation

//Router are used to get control for all navigation status
class FeedsRouter {
    
    weak var viewController: FeedsVC!
    
    ///Use to pass data betweens controllers and get instances
    static func getViewController() -> FeedsVC {
        
        let viewController = FeedsVC()
        let router = FeedsRouter()
        let viewModel = FeedsViewModel()
        
        viewController.vm = viewModel
        viewModel.router = router
        
        viewModel.view = viewController
        
        router.viewController = viewController
    
        return viewController
    }
    
    func pushItemDetail(with item: Item?) {
        let nextVC = ItemDetailRouter.getViewController(with: item)
        viewController.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func goBack(){
        //Avoid crash
        guard viewController != nil else {return}
        viewController.navigationController?.popViewController(animated: true)
    }
}
