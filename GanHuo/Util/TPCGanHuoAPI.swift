//
//  TPCGanHuoAPI.swift
//  GanHuo
//
//  Created by tripleCC on 16/4/12.
//  Copyright © 2016年 tripleCC. All rights reserved.
//

import Foundation

public protocol TPCGanHuoAPI {
    func path() -> String
}

public enum TPCGanHuoType {
    #if GanHuoDev
    static var TPCGanHuoBaseURLString: String {
        get {
            if let _ = UIDevice.currentDevice().name.lowercaseString.rangeOfString("simulator") {
                return "http://localhost/ganhuo/"
            } else {
                return "http://192.168.1.102/ganhuo/"
            }
        }
    }
    #else
    static let TPCGanHuoBaseURLString = "https://raw.githubusercontent.com/tripleCC/GanHuo/master/"
    #endif
    public enum ImageTypeSubtype: TPCGanHuoAPI {
        static let ImageTypeSubtypeURLString = "images/"
        case VenusImage(Int)
        case SelfImage(Int, Int, Int)
        
        public func path() -> String {
            var pathComponent = String()
            switch self {
            case let .VenusImage(dayInterval):
                pathComponent = "venusImages/\(dayInterval).png"
            case let .SelfImage(year, month, day):
                pathComponent = "selfImages/\(year)\(month)\(day).png"
            }
            return TPCGanHuoType.TPCGanHuoBaseURLString + ImageTypeSubtype.ImageTypeSubtypeURLString + pathComponent
        }
    }
    case ImageType(ImageTypeSubtype)
    
    public enum ConfigTypeSubtype: String, TPCGanHuoAPI {
        static let ConfigTypeSubtypeURLString = "configuration/"
        case AboutMe = "AboutMe"
        case LaunchConfig = "LaunchConfig"
        case HotfixStatus = "HotfixStatus"
        public func path() -> String {
            var pathComponent = String()
            switch self {
            case .AboutMe:
                pathComponent = "AboutMe.json"
            case .LaunchConfig:
                pathComponent = "LaunchConfig.json"
            case .HotfixStatus:
                pathComponent = "HotfixStatus.json"
            }
            
            return TPCGanHuoType.TPCGanHuoBaseURLString + ConfigTypeSubtype.ConfigTypeSubtypeURLString + pathComponent
        }
    }
    case ConfigType(ConfigTypeSubtype)
}



public enum TPCTechnicalType: TPCGanHuoAPI {
    static let TPCGankBaseURLString = "http://gank.io/api"
    case Data(String, Int, Int)
    case Day(Int, Int, Int)
    case Random(String, Int)
    case AvailableDay
    case Add2Gank
    
    public func path() -> String {
        var pathComponent = String()
        switch self {
        case let .Data(type, count, page):
            pathComponent = "/data/\(type)/\(count)/\(page)"
        case let .Day(year, month, day):
            pathComponent = "/day/\(year)/\(month)/\(day)"
        case let .Random(type, count):
            pathComponent = "/data/\(type)/\(count)"
        case .AvailableDay:
            pathComponent = "/day/history"
        case .Add2Gank:
            // 这个是https的
            pathComponent = "/add2gank"
            return "https://gank.io/api" + pathComponent
        }
        return TPCTechnicalType.TPCGankBaseURLString + pathComponent
    }
}
