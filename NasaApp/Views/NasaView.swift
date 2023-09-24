//
//  NasaView.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/23/23.
//

import SwiftUI

struct NasaView: View {
    
    @StateObject private var viewModel = NasaViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                Image(uiImage: viewModel.image ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 25))

                ScrollView(showsIndicators: false) {
                    Text(viewModel.apod?.explanation ?? "")
                        .font(.body)
                        .lineSpacing(5)
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .onAppear { viewModel.fetchAPOD() }
            .navigationTitle(viewModel.apod?.title ?? "Title")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct NasaView_Previews: PreviewProvider {
    static var previews: some View {
        NasaView()
    }
}
