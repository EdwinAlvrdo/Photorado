//
//  FeedViewModel.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation

protocol FeedsProtocol: BaseMVVMProtocol {
    func didLoadView()
}

class FeedsViewModel {
    
    weak var view: FeedsProtocol!
    var router: FeedsRouter!

    var model: FeedsResponse! {
        didSet {
            guard view != nil else {return}
            self.view.didLoadView()
        }
    }
    
    func loadView(){
        //Try fetch config values and initial data for application
        attemptFetchMountainFeed()
    }
    
    func attemptFetchMountainFeed() {
        FeedsService.attemptGetPublicPhotos(from: "coloradomountains") { (response) in
            Loader.shared.dismiss()
            guard let mResponse = response else {
                //Error
                //TODO: retry alert for error
                AlertManager.shared.showAlert(withMessage: ResourceManager.shared.strings.serviceError)
                return
            }
            self.model = mResponse
        }
    }
    
    func attemptFetchRandomFeed() {
        FeedsService.attemptGetPublicPhotos(from: "") { (response) in
            Loader.shared.dismiss()
            guard let mResponse = response else {
                //Error
                //TODO: retry alert for error
                AlertManager.shared.showAlert(withMessage: ResourceManager.shared.strings.serviceError)
                return
            }
            self.model = mResponse
        }
    }
    
    ///For test purpose
    func filterModelBy(author: String) -> [Item] { //"39908901@N06"
        guard let mItems = model.items else { return [] }
        return mItems.filter { ($0.authorId ?? "").elementsEqual(author) }
    }
}

//MARK: - Datasource management
extension FeedsViewModel {
    open var numberOfItems: Int {
        guard let mModel = model, let items = mModel.items else {return 0}
        return items.count
    }
    open func getItem(from indexPath: IndexPath) -> Item? {
        guard let items = model.items else {return nil}
        return items[indexPath.row]
    }
}

//MARK: - Router management
extension FeedsViewModel {
    
    func goDetail(with item: Item?) {
        router.pushItemDetail(with: item)
    }
    
}
