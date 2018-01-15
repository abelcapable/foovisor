//
//  FoodTableViewCell.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit
import UICircularProgressRing

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var constHeight: NSLayoutConstraint!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var viewDetails: UIView!
    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var imgDropDown: UIImageView!
    
    @IBOutlet weak var imgDropUp: UIImageView!
    
    
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblProteins: UILabel!
    @IBOutlet weak var lblFat: UILabel!
    @IBOutlet weak var lblCarbs: UILabel!
    @IBOutlet weak var lblFibers: UILabel!
    @IBOutlet weak var lblCellCals: UILabel!
    
    @IBOutlet weak var circularCarbs: UICircularProgressRingView!
    
    @IBOutlet weak var circularFat: UICircularProgressRingView!
    
    @IBOutlet weak var circularTotal: UICircularProgressRingView!
    
    @IBOutlet weak var circularFibers: UICircularProgressRingView!
    
    @IBOutlet weak var circularProteins: UICircularProgressRingView!
    @IBOutlet weak var lblFoodName: UILabel!
    
    
    var isExpanded:Bool = false
    {
        didSet
        {
            if !isExpanded {
                constHeight.constant = 96.0
                viewDetails.isHidden = true
                imgDropUp.isHidden = true
                imgDropDown.isHidden = false
            } else {
                constHeight.constant = 312.0
                viewDetails.isHidden = false
                imgDropUp.isHidden = false
                imgDropDown.isHidden = true
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        viewContainer.layer.cornerRadius = 20.0
        viewContainer.layer.borderColor = UIColor.black.cgColor
        viewContainer.layer.borderWidth = 1.0
        
        imageFood.layer.cornerRadius = 20.0
     
        
        isExpanded = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
