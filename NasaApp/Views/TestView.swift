//
//  TestView.swift
//  NasaApp
//
//  Created by Tyler Torres on 9/25/23.
//

import SwiftUI

struct TestView: View {
    
    @StateObject var viewModel = NasaViewModel()
    
    var body: some View {
        VStack {
            Text("Hello")
        }
        .onAppear {
            viewModel.fetchAPOD()
        }
    }
    
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
