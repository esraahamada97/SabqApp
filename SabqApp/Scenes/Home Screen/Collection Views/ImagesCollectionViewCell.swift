//
//  ImagesCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/23/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class ImagesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var coverPhoto: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var blockOverlayImage: UIImageView!
     let placeHolderImage = #imageLiteral(resourceName: "logo")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(imagesObj: Comics) {
        let  imageURL = imagesObj.coverPhoto
         let publishDate = imagesObj.publishDate ?? " "
       
        if let apiUrl: URL = URL(string: imageURL ?? "") {
            coverPhoto.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
             coverPhoto.image = placeHolderImage
        }
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        if let dateBefore = dateFormatterGet.date(from: publishDate ) {
            dateFormatterGet.dateFormat = "yyyy-MM-dd"
            let dateAfter = dateFormatterGet.string(from: dateBefore )
           timeLabel.text = dateAfter
        } else {
            print("There was an error decoding the string")
        }
        titleLabel.text = imagesObj.title

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
