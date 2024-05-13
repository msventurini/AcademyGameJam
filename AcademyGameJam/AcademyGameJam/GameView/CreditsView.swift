//
//  CreditsView.swift
//  AcademyGameJam
//
//  Created by Filipe Ilunga on 05/05/24.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        GeometryReader { reader in
            let photoSize = reader.frame(in: .global).height * 0.4
            
            VStack {
                Text("Developers")
                    .font(.largeTitle)
                    .fontDesign(.monospaced)
                    .padding(.vertical)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(Developer.developers) { dev in
                            VStack {
                                Image(dev.photo)
                                    .resizable()
                                    .frame(width: photoSize, height: photoSize)
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.6), radius: 5, y: 2.5)
                                
                                VStack {
                                    Text(dev.name)
                                    
                                    ForEach(0..<dev.links.count, id: \.self) { linkIdx in
                                        let link = dev.links[linkIdx]
                                        Link(link.name, destination: URL(string: link.link)!)
                                    }
                                }
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .strokeBorder(style: StrokeStyle(lineWidth: 1.5, dash: [12]))
                                }
                                
                                Divider()
                                    .padding(4)
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .scrollIndicators(.hidden)
            }
        }
    }
}

struct Developer: Identifiable {
    static private let Gabriel: Developer = .init(name: "Gabriel M. Martins", photo: "gabriel-pfp", links: [(name: "LinkedIn", link: "https://www.linkedin.com/in/gabriel-medeiros-martins/")])
    static private let Gustavo: Developer = .init(name: "Gustavo Silvano", photo: "gustavo-pfp", links: [(name: "LinkedIn", link: "https://www.linkedin.com/in/gustavo-zahorcsak-matias-silvano-983b28247/")])
    static private let Matheus: Developer = .init(name: "Matheus Silveira Venturini", photo: "matheus-pfp", links: [(name: "LinkedIn", link: "https://www.linkedin.com/in/matheus-silveira-venturini/")])
    static private let Leandro: Developer = .init(name: "Leandro da Nóbrega Silva", photo: "leandro-pfp", links: [(name: "LinkedIn", link: "https://www.linkedin.com/in/leandro-da-n%C3%B3brega-silva-3a7b121aa/")])
    static private let Filipe: Developer = .init(name: "Filipe Ilunga Xindanhi", photo: "filipe-pfp", links: [(name: "LinkedIn", link: "https://www.linkedin.com/in/filipe-ilunga/")])
    static private let GSTV: Developer = .init(name: "Gustavo Diefenbach", photo: "gstv-pfp", links: [(name: "LinkedIn", link: "https://www.linkedin.com/in/gstvdfnbch")])
    
    static let developers: [Developer] = [
        Developer.Gabriel,
        Developer.Gustavo,
        Developer.Matheus,
        Developer.Leandro,
        Developer.Filipe,
        Developer.GSTV
    ]
    
    let id: UUID = .init()
    let name: String
    let photo: String
    let links: [(name: String, link: String)]
}

#Preview {
    CreditsView()
}
