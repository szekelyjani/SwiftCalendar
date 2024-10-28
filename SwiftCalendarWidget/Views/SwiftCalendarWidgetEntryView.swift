//
//  SwiftCalendarWidgetEntryView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 27..
//

import SwiftUI
import WidgetKit

struct SwiftCalendarWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    var entry: CalendarEntry
    
    var body: some View {
        switch family {
        case .systemSmall:
            SwiftCalendarSmallView(entry: entry, streakValue: calculateStreakValue())
        case .systemMedium:
            SwiftCalendarMediumView(entry: entry, streakValue: calculateStreakValue())
        case .accessoryInline:
            Label("Streak - \(calculateStreakValue()) days", systemImage: "swift")
                .widgetURL(URL(string: "streak"))
        case .accessoryCircular:
            SwiftCalendarLockScreenCircularView(entry: entry)
                .widgetURL(URL(string: "streak"))
        case .accessoryRectangular:
            SwiftCalendarLockScreenRectangularView(entry: entry)
                .widgetURL(URL(string: "calendar"))
        default:
            Text("Under development...")
        }
    }
    
    func calculateStreakValue() -> Int {
        guard !entry.days.isEmpty else { return 0 }
        let nonFutureDays = entry.days.filter { $0.date.dayInt <= Date().dayInt }
        var streakCount = 0
        for day in nonFutureDays.reversed() {
            if day.didStudy {
                streakCount += 1
            } else {
                if day.date.dayInt != Date().dayInt {
                    break
                }
            }
        }
        return streakCount
    }
}
