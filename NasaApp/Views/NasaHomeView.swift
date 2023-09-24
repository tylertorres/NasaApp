//
//  NasaHomeView.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/24/23.
//

import SwiftUI

struct NasaHomeView: View {
    
    let menuItems: [String] = [
        "APOD",
        "EPIC",
        "DONKI"
    ]
    
    var body: some View {
        NavigationStack {
            
            GeometryReader { geometry in
                VStack {
                    HStack(spacing: 20) {
                        ForEach(menuItems, id: \.self) { sectionTitle in
                            NavigationLink(destination: NasaAPODView()) {
                                MenuCardView(title: sectionTitle)
                            }
                        }
                    }
                    .frame(height: geometry.size.height / 5)
                    .padding()
                    
                    Spacer()
                }
            }
            .navigationTitle("NASA Home")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NasaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NasaHomeView()
    }
}
