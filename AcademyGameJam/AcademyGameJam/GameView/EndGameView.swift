//
//  EndGameView.swift
//  AcademyGameJam
//
//  Created by Leandro Silva on 05/05/24.
//

import SwiftUI
import GameKit

struct EndGameView: View {
    @State var show: Bool = false
    @Binding var score: Float
    
    var body: some View {
        VStack {
            Text("\(Int(score))")
                .font(.title)
                .foregroundStyle(.white)
                .frame(width: UIScreen.main.bounds.width * 0.30, height: 60)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green) // Definindo a cor de fundo do botão
                        .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
                )
            
            CustomButton(label: "Restart", iconName: "arrow.counterclockwise.circle.fill")
            
            CustomButton(label: "Menu", iconName: "line.3.horizontal")
        }
        .padding(.horizontal, 80)
        .padding(.vertical, 20)
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    EndGameView(score: .constant(10))
}
