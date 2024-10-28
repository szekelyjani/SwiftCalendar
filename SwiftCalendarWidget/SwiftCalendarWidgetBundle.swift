//
//  SwiftCalendarWidgetBundle.swift
//  SwiftCalendarWidget
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import WidgetKit
import SwiftUI

@main
struct SwiftCalendarWidgetBundle: WidgetBundle {
    var body: some Widget {
        SwiftCalendarControl()
        SwiftCalendarWidget()
    }
}
