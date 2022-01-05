//
//  ViewController.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import UIKit
import SnapKit
import SwiftyGif

class SplashVC: UIViewController {

//    MARK: - Declaration & Initialization
    var vm: SplashViewModel!
    
    var splashImage: UIImageView = {
        let v = UIImageView(gifImage: ResourceManager.shared.images.splash)
        return v
    }()
    
    var titleLabel: UILabel = {
        let v = UILabel()
        v.text = ResourceManager.shared.strings.loadingSplashTxt
        v.textColor = ResourceManager.shared.pallete.primaryTint
        v.sizeToFit()
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initView()
        self.vm.attemptFetchBootstrap()
    }
        
    func initView() {
        //Main
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.view.backgroundColor = ResourceManager.shared.pallete.primary
        
        //Splash
        self.view.addSubview(splashImage)
        splashImage.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        splashImage.startAnimating()
    
        //Descr
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(view.snp.bottom).offset(-40)
            make.centerX.equalToSuperview()
        }
    }
//    MARK: - Functions
}

//    MARK: - VM Binding
extension SplashVC: SplashProtocol {
    func didLoadView() {
        self.vm.goFeeds()
    }
}
