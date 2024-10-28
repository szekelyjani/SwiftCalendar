//
//  SwiftCalendarControl.swift
//  SwiftCalendarWidgetExtension
//
//  Created by Szekely Janos on 2024. 10. 28..
//

import SwiftUI
import WidgetKit

struct SwiftCalendarControl: ControlWidget {
    let kind: String = "SwiftCalendarControl"
    
    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: kind) {
            ControlWidgetToggle("Study Swift",
                                isOn: Persistence.currentDay?.didStudy ?? false,
                                action: ControlToggleStudyIntent()) { isOn in
                Label(isOn ? "Studied Swift" : "Study Swift", systemImage: isOn ?
                      "checkmark.circle" : "circle")
            }
                                .tint(.orange)
        }
        .displayName("Study Swift Today")
        .description("Mart that you studied Swift today.")
    }
}
