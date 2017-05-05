//
//  Optional+Extension.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation

extension Optional {
    
//    func apply<U>(f: (T -> U)?) -> U? {
//        switch f {
//        case .some(let someF):
//            return f.map(someF)
//        case .none:
//            return .none
//        }
//    }
    
}

extension Array {
    func apply<U>(fs: [(Element) -> U]) -> [U] {
        var result = [U]()
        for f in fs {
            for element in self.map(f) {
                result.append(element)
            }
        }
        return result
    }
}
//
//infix operator <*> { associativity left }
//
//func <*><T, U>(f: ((T) -> U)?, a: T?) -> U? {
//    return a.apply(f)
//}
//
//func <*><T, U>(f: [(T) -> U], a: [T]) -> [U] {
//    return a.apply(fs: f)
//}



