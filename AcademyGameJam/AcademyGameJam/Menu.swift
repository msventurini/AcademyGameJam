//
//  Menu.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 05/05/24.
//

import SwiftUI

struct Menu: View {
    var body: some View {
       GeometryReader { reader in
            HStack {
                Spacer()
                
                VStack {
                    Spacer()
                    
                    Text("Flower Hive")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink {
                        GameView()
                    } label: {
                        CustomButton(label: "Play", iconName: "play.fill", buttonWidth: reader.size.width * 0.3)
                    }
                    .padding(.bottom)
                    
                    NavigationLink {
                        CreditsView()
                    } label: {
                        CustomButton(label: "Credits", iconName: "list.star", buttonWidth: reader.size.width * 0.3)
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    NavigationStack {
        Menu()
    }
}
