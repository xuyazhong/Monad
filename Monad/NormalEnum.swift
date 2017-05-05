//
//  NormalEnum.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation

class NormalEnum {
    enum State: String {
        case Default = ""
        case Cancelled = "CANCELLED"
        
        static func parseState(state: String?) -> State {
            guard let state = state else {
                return .Default
            }
            return State(rawValue: state) ?? .Default
        }
    }
}
