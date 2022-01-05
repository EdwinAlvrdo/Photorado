//
//  ItemDetailVC.swift
//  Photorado
//
//  Created by Edwin Alvarado on 1/5/22.
//

import UIKit

class ItemDetailVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Dependencies
    var vm: ItemDetailViewModel!

    // MARK: - Instanciate
    class func instantiateViewController() -> ItemDetailVC {
        let storyboard = UIStoryboard.storyboard(.detail)
        let viewController: ItemDetailVC = storyboard.instantiateViewController()
        return viewController
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vm.loadView()
    }
    
    func setImage() {
        // We can reuse this function adding in a utils file and just return the image for set
        imageView.kf.setImage(
            with: vm.getItemImageUrl(),
            placeholder: ResourceManager.shared.images.itemPlaceHolder,
            options: nil)
        { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let value):
                let image = value.image
                self.imageView.setImage(image)
                self.imageView.contentMode = .scaleToFill
            case .failure(_):
                self.imageView.setImage(ResourceManager.shared.images.itemPlaceHolder)
                self.imageView.contentMode = .scaleAspectFit
            }
        }
    }
    
}

//    MARK: - VM Binding
extension ItemDetailVC: ItemDetailProtocol {
    
    func didLoadView() {
        setImage()
        titleLabel.text = vm.getItemTitle()
        descriptionLabel.text = vm.getItemDescription()
    }
    
}
