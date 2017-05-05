//: Playground - noun: a place where people can play
import UIKit

var value: Int? = 2
var newValue = value.map { $0 * 2 }

value = nil
newValue = value.map { $0 * 2 }


let optionalArray: [String?] = ["AA", nil, "BB", "CC"];
var optionalMapResult = optionalArray.map({$0})
var optionalResult = optionalArray.flatMap({$0})
debugPrint("optionalArray: \(optionalArray)")
debugPrint("optionalMapResult: \(optionalMapResult)")
debugPrint("optionalResult: \(optionalResult)")

let avatarURL: String? = "http://qn-fishtrip-img-public01.fishtrip.cn/system/photo/20160826/collection-147220924033271721.jpg-fishmediumwebp"

if let _avatarURL = avatarURL {
    if let url = NSURL(string: _avatarURL) {
        debugPrint(url)
    }
}

avatarURL.flatMap {
    return NSURL(string: $0)
    }

