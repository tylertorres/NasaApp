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
        VStack {
            Image(uiImage: viewModel.image ?? UIImage())
                .resizable()
                .frame(width: 150, height: 150)
        }
        .onAppear { viewModel.fetchAPOD() }
    }
}

struct NasaView_Previews: PreviewProvider {
    static var previews: some View {
        NasaView()
    }
}
