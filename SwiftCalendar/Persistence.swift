//
//  Persistence.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import Foundation
import SwiftData

struct Persistence {
    static var container: ModelContainer {
        let container: ModelContainer = {
            let sharedStoreUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.janos.szekely.SwiftCalendar")!.appendingPathComponent("SwiftCalendar.sqlite")
            let config = ModelConfiguration(url: sharedStoreUrl)
            return try! ModelContainer(for: Day.self, configurations: config)
        }()
        return container
    }
    
    static var currentDay: Day? {
        let context = ModelContext(Persistence.container)
        let today = Date()
        let predicate = #Predicate<Day> { $0.date == today.startOfDay }
        let descriptor = FetchDescriptor(predicate: predicate)
        
        return try? context.fetch(descriptor).first
    }
}
