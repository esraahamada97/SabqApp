//
//  NewsTableViewCell.swift
//  sab2
//
//  Created by user on 10/20/19.
//  Copyright © 2019 esraa mohamed. All rights reserved.
//

import UIKit
import SDWebImage
import DateToolsSwift
class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak private var newsImageView: UIImageView!
    @IBOutlet weak private var timeImageView: UIImageView!
    @IBOutlet weak private var iconImageView: UIImageView!
    @IBOutlet weak private var newsBlueLabel: UILabel!
    @IBOutlet weak private var postTitleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var statisticsLabel: UILabel!
    let placeHolderImage = #imageLiteral(resourceName: "placeholder")
    
    @IBOutlet weak private var playImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configur(materials: Materials) {
        let  imageURL = materials.coverPhoto ?? " "
        let videosCount = materials.videosCount ?? 0
        let  bluelabel = materials.parentCategoryName
        let date = materials.publishDate ?? " "
         let noOfViews = materials.noOfViews ?? 0
        var asDate: Date {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm ss"
            return formatter.date(from: date) ?? Date()
        }
        let timeApart = asDate.timeAgoSinceNow
        if ( videosCount > 0 ) {
            playImageView.isHidden = false
        } else {
            playImageView.isHidden = true
        }
        print(imageURL )
        if let apiUrl: URL = URL(string: imageURL ) {
            newsImageView.sd_setImage(with: apiUrl, placeholderImage: placeHolderImage)
        } else {
            newsImageView.image = placeHolderImage
        }
        
        if (bluelabel?.isEmpty ?? true ) {
            newsBlueLabel.isHidden = true
        } else {
            newsBlueLabel.isHidden = false
            newsBlueLabel.text = bluelabel
        }
        
        postTitleLabel.text = materials.title
     
        dateLabel.text = timeApart
        statisticsLabel.text = "\(noOfViews)"
    }
    
}
