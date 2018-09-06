//
//  Cache.swift
//  Astronomy
//
//  Created by Samantha Gatt on 9/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key, Value> where Key: Hashable {
    
    private var queue = DispatchQueue(label: "com.SamanthaGatt.ios-astronomy.CacheSerialQueue")
    private var cachedItems: [Key: Value] = [:]
    
    subscript(_ key: Key) -> Value? {
        get {
            // waits for synchronous task to complete before going on to other tasks
            return queue.sync { cachedItems[key] ?? nil }
        }
    }
    
    func cache(value: Value, for key: Key) {
        queue.async { self.cachedItems[key] = value }
    }
}
