//
//  SwiftCalendarLockScreenRectangularView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 27..
//

import SwiftUI

struct SwiftCalendarLockScreenRectangularView: View {
    var entry: CalendarEntry
    let columns = Array(repeating: GridItem(.flexible()), count: 7)
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 4) {
            ForEach(entry.days) { day in
                if day.date.monthInt != Date().monthInt {
                    Text(" ")
                        .font(.system(size: 7))
                } else {
                    if day.didStudy {
                        Image(systemName: "swift")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 7, height: 7)
                    } else {
                        Text(day.date.formatted(.dateTime.day()))
                            .font(.system(size: 7))
                            .frame(maxWidth: .infinity)
                    }
                }
            }
        }
    }
}
