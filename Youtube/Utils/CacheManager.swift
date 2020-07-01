//
//  CacheManager.swift
//  Youtube
//
//  Created by Erdem Koçer on 1.07.2020.
//

import Foundation


class CacheManager{
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
