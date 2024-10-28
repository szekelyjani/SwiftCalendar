//
//  CalendarView.swift
//  SwiftCalendar
//
//  Created by Szekely Janos on 2024. 10. 26..
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(filter: #Predicate<Day> { $0.date >= startDate && $0.date < enDate }, sort: \Day.date)
    var days: [Day]
    
    static var startDate: Date { .now.startOfCalendarWithPrefixDays }
    static var enDate: Date { .now.endOfMonth }

    var body: some View {
        NavigationStack {
            VStack {
                CalendarHeaderView()
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                    ForEach(days) { day in
                        Text(day.date.formatted(.dateTime.day()))
                            .fontWeight(.bold)
                            .foregroundStyle(day.didStudy ? .orange : .secondary)
                            .frame(maxWidth: .infinity, minHeight: 40)
                            .background {
                                Circle()
                                    .foregroundStyle(.orange.opacity(day.didStudy ? 0.3 : 0.0))
                            }
                            .onTapGesture {
                                if day.date.dayInt <= Date().dayInt {
                                    day.didStudy.toggle()
                                    try? modelContext.save()
                                    
                                } else {
                                    print("You cannot study in the future")
                                }
                            }
                    }
                }
                Spacer()
            }
            .navigationTitle(Date().formatted(.dateTime.month(.wide)))
            .padding()
            .onAppear {
                if days.isEmpty {
                    createMonthDays(for: .now.startOfPreviousMonth)
                    createMonthDays(for: .now)
                } else if days.count < 10 {
                    createMonthDays(for: .now)
                }
            }
        }
    }

    func createMonthDays(for date: Date) {
        for dayOffset in 0..<date.numberOfDaysInMonth {
            let date = Calendar.current.date(byAdding: .day, value: dayOffset, to: date.startOfMonth)!
            let newDay = Day(date: date, didStudy: false)
            modelContext.insert(newDay)
        }
    }
    
}

#Preview {
    CalendarView()
}
