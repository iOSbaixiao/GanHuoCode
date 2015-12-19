//
//  TPCDispatchUtil.swift
//  WKCC
//
//  Created by tripleCC on 15/12/14.
//  Copyright © 2015年 tripleCC. All rights reserved.
//

import Foundation

func dispatchSeconds(second: NSTimeInterval, action: () -> ()) {
    let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(second * Double(NSEC_PER_SEC)))
    dispatch_after(delayTime, dispatch_get_main_queue()) {
        action()
    }
}