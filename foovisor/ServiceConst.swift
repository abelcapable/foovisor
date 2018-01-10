//
//  ServiceConst.swift
//  TalalkApp
//
//  Created by Abel Molnar on 17/11/16.
//  Copyright © 2016 abel. All rights reserved.
//

import UIKit

class ServiceConst: NSObject {

    class func getBaseUrl()->String{

       return "http://54.72.164.109/itw/food/list/"

    }
    
    class func getDateFormatString() -> String {
        return "yyyy-MM-dd HH:mm:ss"
    }
    
}
