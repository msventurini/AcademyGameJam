//
//  AcademyGameJamApp.swift
//  AcademyGameJam
//
//  Created by Gustavo Diefenbach on 03/05/24.
//

import SwiftUI

@main
struct AcademyGameJamApp: App {
    @StateObject var soundManager: MusicController = MusicController()
    
    var body: some Scene {
        WindowGroup {
            RouterView(initialRoute: Routes.MainMenu)
            .environmentObject(soundManager)
            .preferredColorScheme(.light)
        }
    }
}
