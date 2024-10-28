//
//  AppIntents.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 27..
//

import AppIntents
import Foundation
import SwiftData
import WidgetKit

struct ToggleStudyIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Studied"
    @Parameter(title: "Date")
    var date: Date
    
    init(date: Date) {
        self.date = date
    }
    
    init() { }
    
    func perform() async throws -> some IntentResult {
        let context = ModelContext(Persistence.container)
        let predicate = #Predicate<Day> { $0.date == date }
        let descriptor = FetchDescriptor(predicate: predicate)
        
        guard let day = try! context.fetch(descriptor).first else { return .result() }
        day.didStudy.toggle()
        try! context.save()
        ControlCenter.shared.reloadControls(ofKind: "SwiftCalendarControl")
        return .result()
    }
}

struct ControlToggleStudyIntent: SetValueIntent {
    static var title: LocalizedStringResource = "Control Toggle Studied"
    
    @Parameter(title: "Did Study")
    var value: Bool
    
    func perform() async throws -> some IntentResult {
        let context = ModelContext(Persistence.container)
        let today = Date()
        let predicate = #Predicate<Day> { $0.date == today.startOfDay }
        let descriptor = FetchDescriptor(predicate: predicate)
        
        guard let day = try! context.fetch(descriptor).first else { return .result() }
        day.didStudy = value
        try! context.save()
        WidgetCenter.shared.reloadTimelines(ofKind: "SwiftCalendarControl")
        return .result()
    }
}
