//
//  SplashViewModel.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation

protocol SplashProtocol: BaseMVVMProtocol {
    func didLoadView()
}

class SplashViewModel {
    
    weak var view: SplashProtocol!
    var router: SplashRouter!

    var model: NSObject! { //Bootstrap obj
        didSet {
            self.view.didLoadView()
        }
    }
    
    func loadView(){
        //Try fetch config values and initial data for application
        attemptFetchBootstrap()
    }
    
    func attemptFetchBootstrap() {
        //Save and sync boot config
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.view.didLoadView()
        }
    }
    
    func goFeeds() {
        self.router.goFeeds()
    }
}
