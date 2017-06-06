//
//  API.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import HandyJSON

typealias successBlock = (BaseModel) -> Void
typealias failureBlock = (String) -> Void

class API {

}

extension API {
    
    func star(ok: @escaping successBlock, fail: @escaping failureBlock) {
        let url = "http://alpha-api.fishtrip.cn/api/v1/houses/star"
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .responseString(completionHandler: { (response) in
                switch response.result {
                case .success(let value):
                    BaseModel.deserialize(from: value).map({ok($0)}) ?? fail("解析失败")
                case .failure(let e):
                    debugPrint("failure : \(e)")
                    fail("\(e)")
                }
            })
    }
    
}
