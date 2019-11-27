//
//  VideosCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/24/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class VideosCollectionViewCell: UICollectionViewCell {
  let placeHolderImage = #imageLiteral(resourceName: "logo")
    @IBOutlet weak private var playImage: UIImageView!
    @IBOutlet weak private var coverPhoto: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configur(videosObj: Comics) {
         let videoId = videosObj.vid ?? ""
        let date = videosObj.publishDate ?? " "
        var asDate: Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm ss"
            return formatter.date(from: date) ?? Date()
        }
        let timeApart = asDate.timeAgoSinceNow
        
        let  imageURL = "https://img.youtube.com/vi/"+videoId+"/1.jpg"
        print(imageURL )
        if let apiUrl: URL = URL(string: imageURL ) {
            coverPhoto.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            coverPhoto.image = placeHolderImage
        }
        
        titleLabel.text = videosObj.title
        dateLabel.text = timeApart
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
