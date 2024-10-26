//
//  Day.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import Foundation
import SwiftData

@Model
class Day {
    var date: Date
    var didStudy: Bool
    
    init(date: Date, didStudy: Bool) {
        self.date = date
        self.didStudy = didStudy
    }
}
