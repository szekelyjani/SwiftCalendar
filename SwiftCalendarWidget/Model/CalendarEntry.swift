//
//  CalendarEntry.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import WidgetKit

struct CalendarEntry: TimelineEntry {
    let date: Date
    let days: [Day]
}
