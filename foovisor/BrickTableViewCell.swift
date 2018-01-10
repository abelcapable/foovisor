//
//  BrickTableViewCell.swift
//  foovisor
//
//  Created by Abel Molnar on 2018. 01. 10..
//  Copyright © 2018. Abel Molnar. All rights reserved.
//

import UIKit

class BrickTableViewCell: UITableViewCell {
    @IBOutlet weak var imageFirst: UIImageView!
    
    @IBOutlet weak var imageSecond: UIImageView!
    
    @IBOutlet weak var imageThird: UIImageView!
    
    @IBOutlet weak var imageIsOk: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var labelCalories: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
