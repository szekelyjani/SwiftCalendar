//
//  SwiftCalendarWidget.swift
//  SwiftCalendarWidget
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import SwiftData
import SwiftUI
import WidgetKit

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> CalendarEntry {
        CalendarEntry(date: Date(), days: [])
    }
    
    func getSnapshot(in context: Context, completion: @escaping (CalendarEntry) -> ()) {
        let entry = CalendarEntry(date: Date(), days: fetchDays())
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = CalendarEntry(date: Date(), days: fetchDays())
        let timeline = Timeline(entries: [entry], policy: .after(.now.endOfDay))
        completion(timeline)
    }
    
    func fetchDays() -> [Day] {
        var startDate: Date { .now.startOfCalendarWithPrefixDays }
        var endDate: Date { .now.endOfMonth }
        let predicate = #Predicate<Day> { $0.date >= startDate && $0.date < endDate }
        let descriptor = FetchDescriptor<Day>(predicate: predicate, sortBy: [.init(\.date)])
        
        let modalContext = ModelContext(Persistence.container)
        return try! modalContext.fetch(descriptor)
    }
    
}

struct SwiftCalendarWidget: Widget {
    let kind: String = "SwiftCalendarWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SwiftCalendarWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Swift Study Calendar")
        .description("Track days you study Swift with streaks.")
        .supportedFamilies([.systemSmall, .systemMedium, .accessoryInline, .accessoryCircular, .accessoryRectangular])
    }
}

#Preview(as: .systemSmall) {
    SwiftCalendarWidget()
} timeline: {
    CalendarEntry(date: .now, days: [])
    CalendarEntry(date: .now, days: [])
}
