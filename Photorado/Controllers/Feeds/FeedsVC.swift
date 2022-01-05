//
//  FeedsVC.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import UIKit
import SnapKit

internal let kCollectionViewPadding: CGFloat = 20.0
internal let kCollectionViewColumns: CGFloat = 3.0

class FeedsVC: UIViewController { //or UICollectionViewController

    //    MARK: - Declaration & Initialization
    var vm: FeedsViewModel!
    
    var feedsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let v = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return v
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initView()
        self.vm.loadView()
    }
    
    func initView() {
        //Main
        setNavigation()
        self.view.backgroundColor = ResourceManager.shared.pallete.background
        self.title = ResourceManager.shared.strings.feedTitle
        
        //Collection
        view.addSubview(feedsCollection)
        feedsCollection.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(((self.navigationController?.navigationBar.frame.height) ?? 60) + 10)
            make.centerX.equalToSuperview()
            make.height.width.equalToSuperview().multipliedBy(0.95)
        }
        
        setCollection()
    }
    
    func setNavigation() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.navigationItem.setHidesBackButton(true, animated: true)

        let search = UIBarButtonItem(
            image: ResourceManager.shared.icon.shuffle,
            style: .plain,
            target: self,
            action: Selector("ctaSearch"))
        self.navigationItem.rightBarButtonItem = search
    }
    
    @objc func ctaSearch() {
        vm.attemptFetchRandomFeed()
    }
    
    func setCollection() {
        feedsCollection.delegate = self
        feedsCollection.dataSource = self
        feedsCollection.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.identifier)
        feedsCollection.backgroundColor = ResourceManager.shared.pallete.clear
        feedsCollection.showsVerticalScrollIndicator = false
    }
}

//    MARK: - VM Binding
extension FeedsVC: FeedsProtocol {
    func didLoadView() {
        feedsCollection.reloadData()
    }
}

//    MARK: - Collection Func
extension FeedsVC: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = kCollectionViewPadding
        let collectionViewSize = collectionView.frame.size.width - padding

        return CGSize(width: collectionViewSize/kCollectionViewColumns, height: collectionViewSize/kCollectionViewColumns)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.identifier, for: indexPath) as? ItemCell
        guard let mCell = cell else {return UICollectionViewCell()}
        
        mCell.backgroundColor = ResourceManager.shared.pallete.clear
        mCell.item = vm.getItem(from: indexPath)
        
        return mCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.goDetail(with: vm.getItem(from: indexPath))
    }
    
}
