//
//  MapEnum.swift
//  Monad
//
//  Created by xuyazhong on 2017/5/4.
//  Copyright © 2017年 fishtrip. All rights reserved.
//

import Foundation

class MapEnum {
    enum State: String {
        case Default = ""
        case Cancelled = "CANCELLED"
        
        static func parseState(state: String?) -> State {
            return state.flatMap(State.init) ?? .Default
        }
    }
}
