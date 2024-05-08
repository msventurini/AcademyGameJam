//
//  HashableBinding.swift
//  RouterSwiftUI
//
//  Created by Pedro Mezacasa Muller on 11/04/24.
//

import SwiftUI

// MARK: Just guarantees that Binding are Hashable, so they can be used inside Route nested cases
extension Binding: Equatable where Value: Equatable {
    public static func == (lhs: Binding<Value>, rhs: Binding<Value>) -> Bool {
        lhs.wrappedValue == rhs.wrappedValue
    }
}
extension Binding: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue.hashValue)
    }
}
