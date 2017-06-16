//: Playground - noun: a place where people can play

import UIKit

let optionalArray: [String?] = ["AA", nil, "BB", "CC"];
var optionalMapResult = optionalArray.map({$0})
var optionalflatMapResult = optionalArray.flatMap({$0})
debugPrint("origin: \(optionalArray)")
debugPrint("MapResult: \(optionalMapResult)")
debugPrint("flatMapResult: \(optionalflatMapResult)")

let avatarURL: String? = "http://qn-fishtrip-img-public01.fishtrip.cn/system/photo/20160826/collection-147220924033271721.jpg-fishmediumwebp"

if let _avatarURL = avatarURL {
    if let url = NSURL(string: _avatarURL) {
        debugPrint(url)
    }
}

avatarURL.flatMap {
    return NSURL(string: $0)
}
