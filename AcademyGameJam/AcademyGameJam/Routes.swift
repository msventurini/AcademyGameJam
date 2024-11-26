//
//  Routes.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 07/05/24.
//

import Foundation
import SwiftUI

enum Routes: Route {
    case MainMenu
    case Game(shouldRestart: Binding<Bool>)
    case Credits
    case GameCenter
    case Tutorial
    
    func generateView() -> AnyView {
        switch self {
        case .MainMenu:
            return AnyView(MainMenuView())
        case let .Game(shouldRestart):
            return AnyView(GameView(shouldRestart: shouldRestart))
        case .Credits:
            return AnyView(CreditsView())
        case .GameCenter:
            return AnyView(GameCenterView())
        case .Tutorial:
            return AnyView(TutorialView())
        }
    }
}
