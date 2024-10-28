//
//  SwiftCalendarSmallView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 27..
//

import SwiftUI

struct SwiftCalendarSmallView: View {
    var entry: CalendarEntry
    var streakValue: Int
    var today: Day {
        entry.days.filter { Calendar.current.isDate($0.date, inSameDayAs: .now) }.first ?? .init(date: .distantPast, didStudy: false)
    }
    
    var body: some View {
        VStack {
            Link(destination: URL(string: "streak")!) {
                VStack {
                    Text("\(streakValue)")
                        .font(.system(size: 70, design: .rounded))
                        .bold()
                        .foregroundStyle(streakValue > 0 ? .orange : .pink)
                        .contentTransition(.numericText())
                    
                    Text("day streak")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
            
            Button(today.didStudy ? "Studied" : "Study",
                   systemImage: today.didStudy ? "checkmark.circle" : "book",
                   intent: ToggleStudyIntent(date: today.date))
            .font(.caption2)
            .tint(today.didStudy ? .mint : .orange)
            .controlSize(.small)
        }
    }
}
