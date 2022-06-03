//
//  TitleText.swift
//  ScrollingLazyVStackDemo
//
//  Created by Damjan Dabo on 03.06.22.
//

import SwiftUI

struct TitleText: View {

    @Binding var navigationBarTitle: String

    var body: some View {
        ZStack {
            if navigationBarTitle != "" {
                Text(navigationBarTitle)
                    .font(.headline)
                    .transition(AnyTransition.opacity.animation(.easeInOut))
            }
        }
        .frame(maxWidth: .infinity) // without it, title wouldn't have enough width
    }
}

struct TitleText_Previews: PreviewProvider {
    static var previews: some View {
        TitleText(navigationBarTitle: .constant("Title"))
    }
}
