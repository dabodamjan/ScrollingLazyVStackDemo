//
//  ContentView.swift
//  ScrollingLazyVStackDemo
//
//  Created by Damjan Dabo on 03.06.22.
//

import SwiftUI

struct ContentView: View {

    @State private var navigationBarTitle = ""

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SecondView()) {
                    Text("Go to a second screen")
                }
                .padding()

                NavigationLink(destination: WithImageHeaderView()) {
                    Text("Go to a screen with an image header")
                }
                .padding()

                ScrollingLazyVStack(
                    navigationBarTitle: $navigationBarTitle,
                    title: "First screen's title which goes in multiple lines",
                    content: {
                        ForEach((1...100), id: \.self) { _ in
                            HStack {
                                Text("Mock Row")
                                    .padding()
                            }
                        }
                    })
            }
            .navigationTitle("") // for removing back button text on the pushed screen
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) { // acts as a title
                    TitleText(navigationBarTitle: $navigationBarTitle)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
