//
//  SwiftCalendarLockScreenCircularView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 27..
//

import SwiftUI
import WidgetKit

struct SwiftCalendarLockScreenCircularView: View {
    var entry: CalendarEntry
    
    var currentCalendarDay: Int {
        entry.days.filter { $0.date.monthInt == Date().monthInt }.count
    }
    var daysStudied: Int {
        entry.days.filter { $0.date.monthInt == Date().monthInt }
            .filter { $0.didStudy }.count
    }
    
    var body: some View {
        Gauge(value: Double(daysStudied),
              in: 1...Double(currentCalendarDay)) {
            Image(systemName: "swift")
        } currentValueLabel: {
            Text("\(daysStudied)")
        }
        .gaugeStyle(.accessoryCircular)
    }
}
