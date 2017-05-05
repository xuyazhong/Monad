//
//  Person.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation

struct Person {
    let firstName: String
    let lastName: String
    
    init?(json: [String: Any]) {
        if let firstName = json["firstName"] as? String, let lastName = json["lastName"] as? String {
            self.firstName = firstName
            self.lastName = lastName
            return
        }
        return nil
    }
}
