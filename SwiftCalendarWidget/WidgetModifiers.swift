//
//  WidgetModifiers.swift
//  SwiftCalendarWidgetExtension
//
//  Created by Szekely Janos on 2024. 10. 28..
//

import SwiftUI

struct DidStudyAccent: ViewModifier {
    let didStudy: Bool
    
    func body(content: Content) -> some View {
        if didStudy {
            content.widgetAccentable()
        } else {
            content
        }
    }
}

extension View {
    public func didStudyAccentable(_ didStudy: Bool) -> some View {
        modifier(DidStudyAccent(didStudy: didStudy))
    }
}
