//
//  SplashRouter.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation

//Router are used to get control for all navigation status
class SplashRouter {
    
    weak var viewController: SplashVC!
    
    ///Use to pass data betweens controllers
    static func getViewController() -> SplashVC {
        
        let viewController = SplashVC()
        let router = SplashRouter()
        let viewModel = SplashViewModel()
        
        viewController.vm = viewModel
        viewModel.router = router
        
        viewModel.view = viewController
        
        router.viewController = viewController
    
        return viewController
    }
    
    func goFeeds() {
        let nextVC = FeedsRouter.getViewController()
        viewController.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func goBack(){
        //Avoid crash
        guard viewController != nil else {return}
        viewController.navigationController?.popViewController(animated: true)
    }
}
