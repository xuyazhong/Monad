//
//  Demo.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation

class Demo {
    func test() {
        let a = NormalAgeToString(age: 13)
        let b = LetAgeToString(age: 13)
        let c = MapAgeToString(age: 13)
        debugPrint("a : \(a)")
        debugPrint("b : \(b)")
        debugPrint("c : \(c)")
    }
    
    func NormalAgeToString(age: Int?) -> String {
        return age == nil ? "Unknown age" : "She is (\(age!)) years old"
    }

    func LetAgeToString(age: Int?) -> String {
        if let a = age {
            return "She is (\(a)) years old"
        }
        return "Unknown age"
    }

    func MapAgeToString(age: Int?) -> String {
        return age.map({ "She is (\($0)) years old"}) ?? "Unknown age"
    }

}
