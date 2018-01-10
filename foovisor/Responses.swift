//
//  Responses.swift
//  JarKon
//
//  Created by xami on 2017. 04. 23..
//  Copyright © 2017. Abel Molnar. All rights reserved.
//

import Foundation

import ObjectMapper


public class GetFoodsResponse: Mappable {
    public var data:GetFoodResponse?
    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        data <- map["data"]
    }
}

public class GetFoodResponse: Mappable {
    public var carbs: Double?
    public var display_name: String?
    public var fibers: Int?
    public var proteins: Int?
    public var lipids: Double?
    public var cal: Int?
    public var type: String?
    public var imgUrl: String?
  
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        carbs <- map["carbs"]
        display_name <- map["display_name"]
        fibers <- map["fibers"]
        proteins <- map["proteins"]
        lipids <- map["lipids"]
        cal <- map["cal"]
        type <- map["type"]
        imgUrl <- map["imgUrl"]
        
    }
}
