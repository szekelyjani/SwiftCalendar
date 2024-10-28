//
//  SwiftCalendarMediumView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 27..
//

import SwiftUI

struct SwiftCalendarMediumView: View {
    var entry: CalendarEntry
    var streakValue: Int
    var columns = Array(repeating: GridItem(.flexible()), count: 7)
    var today: Day {
        entry.days.filter { Calendar.current.isDate($0.date, inSameDayAs: .now) }.first ?? .init(date: .distantPast, didStudy: false)
    }
    
    var body: some View {
        HStack {
            VStack {
                Link(destination: URL(string: "streak")!) {
                    VStack {
                        Text("\(streakValue)")
                            .font(.system(size: 70, design: .rounded))
                            .bold()
                            .foregroundStyle(streakValue > 0 ? .orange : .pink)
                            .contentTransition(.numericText())
                        
                        Text("day streak")
                            .font(.caption)
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
            .frame(width: 90)
            
            Link(destination: URL(string: "calendar")!) {
                VStack {
                    CalendarHeaderView(font: .caption)
                    LazyVGrid(columns: columns, spacing: 7) {
                        ForEach(entry.days) { day in
                            if day.date.monthInt != Date().monthInt {
                                Text("")
                            } else {
                                Text(day.date.formatted(.dateTime.day()))
                                    .font(.caption2)
                                    .bold()
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(day.didStudy ? .orange : .secondary)
                                    .background {
                                        Circle()
                                            .foregroundStyle(.orange.opacity(day.didStudy ? 0.3 : 0.0))
                                            .scaleEffect(1.3)
                                    }
                            }
                        }
                    }
                }
                .padding(.leading, 6)
            }
        }
    }
}
