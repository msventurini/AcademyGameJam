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
            Text("Créditos")
                .font(.title)
                .foregroundColor(.blue)
                .padding(.top, 20)
            
            Text("Desenvolvido por:")
                .font(.headline)
                .foregroundColor(.gray)
            
            Text("Matheus")
            Text("Gabriel")
            Text("Gustavo")
            Text("Filipe")
            Text("Leandro")
            Text("Gustavo (gst)")
                .padding(.bottom, 20)

        }
        .padding()
    }
}
