//
//  Network.swift
//  HyAlbum
//
//  Created by 장혜준 on 2018. 5. 16..
//  Copyright © 2018년 장혜준. All rights reserved.
//

import Alamofire
import ObjectMapper

struct API {
    
    static func getPhotos(completion: @escaping (Feed) -> Void) {
        let urlString: String = "https://api.flickr.com/services/feeds/photos_public.gne"
        let parameters: [String: Any] = [
            "format": "json",
            "nojsoncallback": "1"
        ]
        
        Alamofire.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).validate(statusCode: 200 ..< 400).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let feed = Mapper<Feed>().map(JSONObject: value) {
                    completion(feed)
                }
                
                else {
                    print("Error : Mapper 실패")
                }
                
            case .failure(let error):
                print("Error : \(error)")
            }
        }
    }

}
