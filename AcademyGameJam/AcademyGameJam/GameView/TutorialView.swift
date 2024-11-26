//
//  TutorialView.swift
//  AcademyGameJam
//
//  Created by Gabriel Medeiros Martins on 26/11/24.
//

import SwiftUI

struct TutorialView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var page: Int = 0
    
    var body: some View {
        GeometryReader { reader in
            VStack {
                TabView(selection: $page) {
                    VStack(spacing: 16) {
                        Text("In Garden's Guardin you are a small little bee trying to save the world!")
                        
                        Image("InGame")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.5), radius: 10)
                            .frame(maxHeight: reader.size.height * 0.5)
                        
                        Text("The world is dying without any pollinization... Let's pollinate it!")
                    }
                    .tag(0)
                    
                    VStack(spacing: 16) {
                        Text("First interact with flowers to collect some pollen.")
                        
                        Image("Pollinating")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.5), radius: 10)
                            .frame(maxHeight: reader.size.height * 0.5)
                        
                        Text("And then walk around the world to disperse it, bringing life back to it!")
                    }
                    .tag(1)
                    
                    VStack(spacing: 16) {
                        Text("The more you colect pollen and then disperse it, the healthier the world becomes.")
                        
                        Image("Pollineted")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.5), radius: 10)
                            .frame(maxHeight: reader.size.height * 0.5)
                        
                        Text("Turn the world green again!")
                    }
                    .tag(2)
                    
                    VStack(spacing: 16) {
                        Text("But beware! There are some heavy pollution clouds roaming about...")
                        
                        Image("Pollution")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.5), radius: 10)
                            .frame(maxHeight: reader.size.height * 0.5)
                        
                        Text("Try to stay away from them!")
                    }
                    .tag(3)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
                
                Button {
                    if page < 3 {
                        withAnimation {
                            page += 1
                        }
                    } else {
                        dismiss()
                    }
                } label: {
                    CustomButton(label: page >= 3 ? "Let's Play" : "Next", isSmall: true)
                        .animation(.easeInOut, value: page)
                }
            }
            .padding(.vertical)
        }
        
    }
}

#Preview {
    NavigationStack {
        NavigationLink {
            TutorialView()
        } label: {
            Text("Navigate")
        }
    }
}
