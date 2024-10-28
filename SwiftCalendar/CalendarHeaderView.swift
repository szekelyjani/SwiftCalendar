//
//  CalendarHeaderView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import SwiftUI

struct DaysOfWeek: Hashable {
    let id = UUID()
    var day: String
}

struct CalendarHeaderView: View {
    let daysOfWeek: [DaysOfWeek] = [DaysOfWeek(day: "S"),
                                    DaysOfWeek(day: "M"),
                                    DaysOfWeek(day: "T"),
                                    DaysOfWeek(day: "W"),
                                    DaysOfWeek(day: "T"),
                                    DaysOfWeek(day: "F"),
                                    DaysOfWeek(day: "S")]
    var font: Font = .body
    
    var body: some View {
        
        HStack {
            ForEach(daysOfWeek, id: \.self) { dayOfWeek in
                Text(dayOfWeek.day)
                    .font(font)
                    .fontWeight(.black)
                    .foregroundStyle(.orange)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    CalendarHeaderView()
}
