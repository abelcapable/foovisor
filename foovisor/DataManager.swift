//
//  DataManager.swift
//  e-Car
//
//  Created by Abel Molnar on 2017. 07. 30..
//  Copyright © 2017. Abel Molnar. All rights reserved.
//

import UIKit


class DataManager: NSObject {
    
    static var foods:[GetFoodResponse]?
    {
        didSet {
            if let _ = foods {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "foods_downloaded"), object: nil, userInfo: nil)
                print("foods didset")
            }
        }
    }
  
}
