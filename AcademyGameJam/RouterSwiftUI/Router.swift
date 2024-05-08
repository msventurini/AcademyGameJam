//
//  RouterSwiftUI.swift
//  RouterSwiftUI
//
//  Created by Pedro Mezacasa Muller on 11/04/24.
//

import SwiftUI
import Combine

/// Responsible for controlling the current view stack in SwiftUI.
/// You dont instatiate a Router, you get the instance as an environment from a RouterView.
public class Router: ObservableObject, Equatable {
    public static func == (lhs: Router, rhs: Router) -> Bool {
        lhs.path == rhs.path
    }
    
    /// Used to programatically control our navigation stack
    @Published public var path: NavigationPath = NavigationPath()
    
    /// Builds the views for the specified route
    @ViewBuilder func view(for route: any Route) -> AnyView {
        route.generateView()
    }
    
    /// Appends the view from the route to the stack
    public func push(_ appRoute: some Route) {
        path.append(appRoute)
    }
    
    /// Pops the top of the view Stack, navigating back to the last view
    private func popOne() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    /// Pop to the root screen in our hierarchy
    private func popToRoot() {
        if path.count > 0 {
            path.removeLast(path.count)
        }
    }
    
    public func pop(toRoot: Bool = false) {
        if toRoot {
            popToRoot()
        } else {
            popOne()
        }
    }
}

