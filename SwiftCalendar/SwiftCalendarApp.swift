//
//  SwiftCalendarApp.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import SwiftUI
import SwiftData

enum TabSelection: Hashable {
    case calendar
    case streak
}

@main
struct SwiftCalendarApp: App {
    @State private var selectedTab: TabSelection = .calendar
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                Tab("Calendar", systemImage: "calendar", value: .calendar) {
                    CalendarView()
                }
                Tab("Streak", systemImage: "swift", value: .streak) {
                    StreakView()
                }
            }
            .modelContainer(Persistence.container)
            .onOpenURL { url in
                selectedTab = url.absoluteString == "calendar" ? .calendar : .streak
            }
        }
    }
}
