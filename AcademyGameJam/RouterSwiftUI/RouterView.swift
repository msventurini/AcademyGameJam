//
//  RouterView.swift
//  RouterSwiftUI
//
//  Created by Pedro Mezacasa Muller on 11/04/24.
//

import SwiftUI

/// This should be the root view, representing a Navigation Stack.
/// This RouterView generates and injects a Router instance using .environmentObject
public struct RouterView<RouteType: Route>: View {
    
    /// The router created for this RouterView
    @StateObject public var router: Router = Router()
    
    /// The root View
    private let content: AnyView
    
    /// - Parameters:
    ///   - initialRoute: Designates what kind of route the router will be using and what is the root view.
    public init(initialRoute: RouteType) {
        self.content = initialRoute.generateView()
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            content
                .navigationDestination(for: RouteType.self) { route in
                    router.view(for: route)
                }
        }
        .environmentObject(router)
    }
}
