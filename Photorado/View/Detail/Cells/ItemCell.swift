//
//  ItemCell.swift
//  Photorado
//
//  Created by Edwin Alvarado on 4/17/21.
//

import Foundation
import UIKit
import Kingfisher

class ItemCell: UICollectionViewCell {
     
    //    MARK: - Declaration & Initialization
    public static let identifier = "item-cell-id"
    
    var image: UIImageView = {
        let v = UIImageView(gifImage: ResourceManager.shared.images.itemLoading)
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var overlayGradientView: UIView = {
        let v = UIView()
        return v
    }()
    
    var titleLabel: UILabel = {
        let v = UILabel()
        v.text = ""
        v.textColor = ResourceManager.shared.pallete.primaryTint
        v.font = UIFont.boldSystemFont(ofSize: 11)
        return v
    }()
    
    var descriptionLabel: UILabel = {
        let v = UILabel()
        v.text = ""
        v.textColor = ResourceManager.shared.pallete.primaryTint.withAlphaComponent(0.8)
        v.font = UIFont.systemFont(ofSize: 10)
        return v
    }()
    
    var item: Item? {
        didSet {
            guard let item = self.item else {return}
            self.setupCell(with: item)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initView() {
        backgroundColor = ResourceManager.shared.pallete.white
        
        self.addSubview(image)
        image.snp.makeConstraints { (make) in
            make.center.height.width.equalToSuperview()
        }

        self.addSubview(overlayGradientView)
        overlayGradientView.snp.makeConstraints { (make) in
            make.width.centerX.bottom.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.37)
        }
        
        self.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.10)
            make.bottom.equalToSuperview().offset(-5)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.centerX.equalToSuperview()
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.10)
            make.bottom.equalTo(descriptionLabel.snp.top).offset(-5)
            make.width.equalToSuperview().multipliedBy(0.95)
            make.centerX.equalToSuperview()
        }
    }
    
    //    MARK: - Functions
    func setupCell(with item: Item) {
        setImage(with: item.media)
        setLabel(title: item.title, author: item.author)
    }
    
    func setImage(with media: Media?) {
        guard let mMedia = media, let url = mMedia.m else {
            return
        }
        image.kf.setImage(
            with: URL(string: url),
            placeholder: ResourceManager.shared.images.itemPlaceHolder,
            options: nil)
        {
            result in
                switch result {
                case .success(let value):
                    let image = value.image
                    self.image.setImage(image)
                    self.image.contentMode = .scaleToFill
                    self.setGradient()
                case .failure(_):
                    self.image.setImage(ResourceManager.shared.images.itemPlaceHolder)
                    self.image.contentMode = .scaleAspectFit
                }
        }
    }
    
    func setGradient() {
        image.addBlackGradientLayerInForeground(
            frame: image.frame,
            colors: [
                UIColor.clear,
                UIColor.black
            ])
    }
    
    func setLabel(title: String? = "", author: String? = "") {
        titleLabel.text = title
        descriptionLabel.text = "by \(author ?? "Unknow")"
    }
    
}
