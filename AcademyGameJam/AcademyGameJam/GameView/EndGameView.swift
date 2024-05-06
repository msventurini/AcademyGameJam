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
    
    var body: some View {
        VStack {
            Text("score")
                .font(.title)
                .frame(width: 200, height: 100)
                .padding(.vertical, 16)
                .padding(.horizontal, 32)
                .foregroundStyle(.white)
                .cornerRadius(32)
            
            Button {
                
            } label: {
                Text("Restart")
                    .frame(width: 200, height: 100)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 32)
                    .foregroundStyle(.white)
                    .cornerRadius(32)
            }
            
            Button {
                // Implement your submit score functionality here
            } label: {
                Text("Menu")
                    .frame(width: 200, height: 100)
                    .padding(.vertical, 16)
                    .padding(.horizontal, 32)
                    .foregroundStyle(.white)
                    .cornerRadius(32)
            }
        }
        .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.8)
        .background(Color.green)
        .cornerRadius(10)
    }
}

#Preview {
    EndGameView()
}
