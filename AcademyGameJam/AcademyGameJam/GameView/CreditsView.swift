//
//  CreditsView.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 05/05/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 10) {
            
            Text("Developed by:")
                .font(.title2)
                .foregroundColor(.green)
                .bold()
            
            Text("Gabriel Martins")
            Text("Gustavo Silvano")
            Text("Matheus Silveira Venturini")
            Text("Leandro da Nóbrega Silva")
            Text("Filipe Ilunga Xindanhi")
            Text("Leandro da Nóbrega")
            Text("Gustavo Diefenbach")

                .padding(.bottom, 20)

        }
        .padding()
    }
}
