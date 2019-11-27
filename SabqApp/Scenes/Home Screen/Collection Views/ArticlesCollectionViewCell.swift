//
//  ArticlesCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/27/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var subTitleLabel: UILabel!
    @IBOutlet weak private var userImageView: UIImageView!
    let placeHolderImage = #imageLiteral(resourceName: "logo")
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.layer.cornerRadius = 30
        
    }
    
    func configur(articlesObj: Materials ) {
        let  imageURL = articlesObj.authorImg
        print(imageURL ?? "")
        if let apiUrl: URL = URL(string: imageURL ?? "") {
                userImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            userImageView.image = placeHolderImage
        }
        titleLabel.text = articlesObj.title
        subTitleLabel.text = articlesObj.authorName
        
    }
    override func preferredLayoutAttributesFitting(
        _ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }

}
