//
//  Route.swift
//  RouterSwiftUI
//
//  Created by Pedro Mezacasa Muller on 11/04/24.
//

import Foundation
import SwiftUI

/**
 Routes are, in general, enums that maps to a View. They are used by Routers to navigate from a View to another one without the starting View knowing the destination View
 You can use nested variables to inject dependencies into View Models. For example:
    case MyCalendarScreen(Binding, String)
 This enum case can be used for instantiating a View that requires a Binding(of any kind, this is just an example) and a String.
 */
public protocol Route: Hashable, Equatable {
    
    /// Responsible for generating the View out of the enum case.
    @ViewBuilder func generateView() -> AnyView
}
