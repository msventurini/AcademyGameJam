//
//  CustomButton.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 05/05/24.
//

import SwiftUI

struct CustomButton: View {
    var label: String
    var iconName: String
    var buttonWidth: CGFloat = UIScreen.main.bounds.width * 0.30
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title)
                .bold()
            
            Text(label)
                .font(.title3)
        }
        .foregroundStyle(.white)
        .frame(width: buttonWidth, height: 60)
        .padding(.horizontal, 10)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.green)
                .shadow(color: .black.opacity(0.45), radius: 5, y: 5)
        )
    }
}
