//
//  CustomButton.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 05/05/24.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var iconName: String = ""
    var isSmall: Bool = false
    
    var body: some View {
        HStack {
            if !isSmall {
                Spacer()
            }
            
            if !iconName.isEmpty {
                Image(systemName: iconName)
                    .font(.title)
                    .bold()
            }
            
            Text(label)
                .font(.title)
            
            if !isSmall {
                Spacer()
            }
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
        )
    }
}


#Preview {
    VStack {
        CustomButton(label: "Play", iconName: "play.fill")
        CustomButton(label: "Play")
        CustomButton(label: "Play", iconName: "play.fill", isSmall: true)
        CustomButton(label: "Play", isSmall: true)
    }
}
