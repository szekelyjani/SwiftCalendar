//
//  Item.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
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
