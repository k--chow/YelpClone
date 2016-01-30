//
//  BusinessViewCell.swift
//  YelpClone
//
//  Created by Kevin Chow on 1/29/16.
//  Copyright © 2016 Kevin Chow. All rights reserved.
//

import UIKit
import AFNetworking


class BusinessViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingImageView: UIImageView!
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var business: Business! {
        didSet {
            
            thumbImageView.setImageWithURL(business.imageURL!)
            ratingImageView.setImageWithURL(business.ratingImageURL!)
            nameLabel.text = business.name
            distanceLabel.text = business.distance
            typeLabel.text = business.categories
            reviewsLabel.text = "\(business.reviewCount!) Reviews"
            addressLabel.text = business.address
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
