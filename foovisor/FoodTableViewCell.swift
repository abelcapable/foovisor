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

    @IBOutlet weak var imageFood: UIImageView!
    
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var lblProteins: UILabel!
    @IBOutlet weak var lblFat: UILabel!
    @IBOutlet weak var lblCarbs: UILabel!
    @IBOutlet weak var lblFibers: UILabel!
    
    @IBOutlet weak var circularCarbs: UICircularProgressRingView!
    
    @IBOutlet weak var circularFat: UICircularProgressRingView!
    
    @IBOutlet weak var circularTotal: UICircularProgressRingView!
    
    @IBOutlet weak var circularFibers: UICircularProgressRingView!
    
    @IBOutlet weak var circularProteins: UICircularProgressRingView!
    @IBOutlet weak var lblFoodName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
