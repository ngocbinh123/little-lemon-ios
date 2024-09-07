//
//  Item.swift
//  little-lemon-final-assigment
//
//  Created by Nguyen Ngoc Binh on 8/29/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
