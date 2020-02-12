//
//  Entry.swift
//  JBullet
//
//  Created by Desire Guilarte on 2020/2/8.
//  Copyright © 2020 DesGui. All rights reserved.
//

import Foundation
import UIKit

struct Entry {
    
    var type: String
    var text: String
    var priority: Bool
    var inspiration: Bool
    
    init(type: String, text: String, priority: Bool, inspiration: Bool) {
        self.type = type
        self.text = text
        self.priority = priority
        self.inspiration = inspiration
    }
}
