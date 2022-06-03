//
//  WithImageHeaderView.swift
//  ScrollingLazyVStackDemo
//
//  Created by Damjan Dabo on 03.06.22.
//

import SwiftUI

struct WithImageHeaderView: View {

    @State private var navigationBarTitle = ""

    var body: some View {
        ScrollingLazyVStack(
            navigationBarTitle: $navigationBarTitle,
            title: "Screen with an image header",
            customHeader: { customHeader },
            content: {
                ForEach((1...100), id: \.self) { _ in
                    HStack {
                        Text("Mock Row")
                            .padding()
                    }
                }
            })
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    TitleText(navigationBarTitle: $navigationBarTitle)
                }
            }
    }

    @ViewBuilder
    private var customHeader: some View {
        Image("OlympiaparkMunich")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct WithImageHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        WithImageHeaderView()
    }
}
