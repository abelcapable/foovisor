//
//  BrickTableViewCell.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit

class BrickTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var imageFirst: UIImageView!
    @IBOutlet weak var imageSecond: UIImageView!
    @IBOutlet weak var imageThird: UIImageView!
    
    @IBOutlet weak var labelCalories: UILabel!
    
    @IBOutlet weak var labelMenu: UILabel!
    
    @IBOutlet weak var labelFood1: UILabel!
    @IBOutlet weak var labelFood2: UILabel!
    @IBOutlet weak var labelFood3: UILabel!
    
    @IBOutlet weak var labelCal1: UILabel!
    @IBOutlet weak var labelCal2: UILabel!
    @IBOutlet weak var labelCal3: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.cornerRadius = 20.0
        containerView.layer.borderColor = UIColor.black.cgColor
        containerView.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
