//
//  SecondView.swift
//  ScrollingLazyVStackDemo
//
//  Created by Damjan Dabo on 03.06.22.
//

import SwiftUI

struct SecondView: View {

    @State private var navigationBarTitle = ""

    var body: some View {
        ScrollingLazyVStack(
            navigationBarTitle: $navigationBarTitle,
            title: "Title which goes in multiple lines",
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
        Text("Custom header which can be any View")
            .padding()
            .background(Color.blue)
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
