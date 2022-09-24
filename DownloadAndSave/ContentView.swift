//
//  ContentView.swift
//  DownloadAndSave
//
//  Created by Sajad Abedi on 24.09.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = DownloadingImagesViewModel()
        var body: some View {
            NavigationStack {
                List{
                    ForEach(viewModel.data) { model in
                        DownloadingImagesRow(model: model)
                    } 
                }
                .navigationTitle("Placeholder")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
