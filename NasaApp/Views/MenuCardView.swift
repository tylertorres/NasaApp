//
//  MenuCardView.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/24/23.
//

import SwiftUI

struct MenuCardView: View {
    
    var title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.blue)
                .scaledToFit()
            
            Text(title)
                .font(.body.bold())
                .foregroundColor(.white)
        }
    }
}

struct MenuCardView_Previews: PreviewProvider {
    static var previews: some View {
        MenuCardView(title: "APOD")
    }
}
