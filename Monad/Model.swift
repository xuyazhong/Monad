//
//  Model.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/5.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation
import HandyJSON

class BaseModel: HandyJSON {
    var status:String = ""
    var msg: String = ""
    var data:[HouseModel]?
    
    required init() {
        
    }
}

struct HouseModel: HandyJSON {
    var type: String?
    var house_id: String?
    var house_encoded_id: String?
    var house_name: String?
    var location: String?
    var house_photo_paths: [HousePhotoPath]?
    var lowest_price: Int?
    var currency: String?
    var room_count: Int?
    var comment_count: Int?
    var reward: Int?
    var city_id: Int?
    var city_name: String?
    var location_tag_name: String?
    var feature_tag_name: String?
    var rate_score: [Int]?
    var is_collected: String?
    var title: String?
    var url: String?
    var desc: String?
    var collection_id: Int?
    var country_name: String?
    var button_name: String?
    var photo_path: String?
    var photo_webp_path: String?
}

struct HousePhotoPath: HandyJSON {
    var url: String?
    var webp_url: String?
}
