//
//  PauseMenu.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 04/05/24.
//

import SwiftUI

struct PauseMenu: View {
    var body: some View {
        VStack {
            Text("Ola")
        }
        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.8)
        .background(Color.red)
        .cornerRadius(10)
    }
}

#Preview {
    PauseMenu()
}
