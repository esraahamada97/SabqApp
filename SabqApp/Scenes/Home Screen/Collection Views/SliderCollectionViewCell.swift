//
//  SliderCollectionViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var sliderImageView: UIImageView!
    @IBOutlet weak private var sliderBigTittle: UILabel!
    @IBOutlet weak private var sliderDescription: UILabel!
    @IBOutlet weak private var timeImageView: UIImageView!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var iconhotImageView: UIImageView!
    @IBOutlet weak private var statisticsLabel: UILabel!
    
    let placeHolderImage = #imageLiteral(resourceName: "placeholder")
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        sliderDescription.textColor = UIColor(named: "subtitleText Color")
    }
    func configur(slioderObj: Slider) {
        let  imageURL = slioderObj.coverPhoto
        let secondryTitle = slioderObj.secondaryTitle ?? " "
        let description = slioderObj.description ?? " "
        let date = slioderObj.publishDate ?? " "
        var asDate: Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm ss"
            return formatter.date(from: date) ?? Date()
        }
        let timeApart = asDate.timeAgoSinceNow
        let noOfViews = slioderObj.noOfViews ?? 0
        if let apiUrl: URL = URL(string: imageURL ?? "" ) {
            sliderImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            sliderImageView.image = placeHolderImage
        }
        sliderBigTittle.text = secondryTitle
        guard  let data = description.data(using: String.Encoding.unicode) else {
            fatalError("nodata")
        }
        let attrStr = try? NSAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        sliderDescription .attributedText = attrStr
        statisticsLabel.text = "\(noOfViews)"
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
