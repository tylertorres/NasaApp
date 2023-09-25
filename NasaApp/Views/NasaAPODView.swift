//
//  NasaAPODView.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import SwiftUI

struct NasaAPODView: View {
    
    @StateObject private var viewModel = NasaViewModel()
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                if let uiImage = viewModel.apodDisplay?.image {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
//                        .overlay(
//                            if viewModel.image.
//                        )
                } else {
                    // Placeholder for when the image is nil or loading
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.5)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                }
                
                ScrollView(showsIndicators: false) {
                    Text(viewModel.apodDisplay?.apod.explanation ?? "")
                        .font(.body)
                        .lineSpacing(5)
                        .padding()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .onAppear { viewModel.fetchAPOD() }
        .navigationTitle(viewModel.apodDisplay?.apod.title ?? "Title")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct NasaAPODView_Previews: PreviewProvider {
    static var previews: some View {
        NasaAPODView()
    }
}
