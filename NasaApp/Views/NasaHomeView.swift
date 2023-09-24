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
        GeometryReader { geometry in
            VStack {
                HStack(spacing: 20) {
                    ForEach(menuItems, id: \.self) { sectionTitle in
                        MenuCardView(title: sectionTitle)
                    }
                }
                .frame(height: geometry.size.height / 5)
                .padding()
                
                Spacer()
            }
        }
    }
    
}

struct NasaHomeView_Previews: PreviewProvider {
    static var previews: some View {
        NasaHomeView()
    }
}
