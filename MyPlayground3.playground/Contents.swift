//: Playground - noun: a place where people can play

import UIKit

var value: Int? = 2
var newValue = value.map { $0 * 2 }

value = nil
newValue = value.map { $0 * 2 }


let tq: Int? = 1
let b = tq.map { (a: Int) -> Int? in
    if a % 2 == 0 {
        return a
    } else {
        return nil
    }
}

if let _ = b {
    print("not nil")
}
