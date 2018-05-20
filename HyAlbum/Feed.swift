//
//  Model.swift
//  HyAlbum
//
//  Created by 장혜준 on 2018. 5. 17..
//  Copyright © 2018년 장혜준. All rights reserved.
//

import ObjectMapper

struct Feed: Mappable {
    
    var items: [Dictionary<String, Any>]?
    var imageURLArray: [String] = [String]()
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.items <- map["items"]
        
        if self.items != nil {
            for item in items! {
                let media: Dictionary<String, Any> = item["media"] as! Dictionary<String, Any>
                
                if !media.isEmpty {
                    self.imageURLArray.append(media["m"] as! String)
                }
            }
        }
    }
    
}
