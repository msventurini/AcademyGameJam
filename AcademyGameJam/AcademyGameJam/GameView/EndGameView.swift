//
//  EndGameView.swift
//  AcademyGameJam
//
//  Created by Leandro Silva on 05/05/24.
//

import SwiftUI
import GameKit

struct EndGameView: View {
    @EnvironmentObject private var router: Router
    
    @Binding var score: Float
    @Binding var shouldRestart: Bool
    
    var body: some View {
        VStack {
            Text("Score: \(Int(score))")
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width * 0.30, height: 60)
                .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                .padding(.horizontal, 10)
            
            CustomButton(label: "Restart", iconName: "arrow.counterclockwise.circle.fill")
                .onTapGesture {
                    shouldRestart = true
                }
            
            CustomButton(label: "Menu", iconName: "line.3.horizontal")
                .onTapGesture {
                    router.pop(toRoot: true)
                }
        }
        .padding(.horizontal, 80)
        .padding(.vertical, 20)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

#Preview {
    EndGameView(score: .constant(10), shouldRestart: .constant(false))
        .environmentObject(Router())
}
