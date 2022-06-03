//
//  ScrollingLazyVStack.swift
//  ScrollingLazyVStackDemo
//
//  Created by Damjan Dabo on 03.06.22.
//

import SwiftUI

struct ScrollingLazyVStack<CustomHeader: View, Content: View>: View {

    @State private var headerHeight: CGFloat = 0
    @Binding private var navigationBarTitle: String
    private var title: String
    private var customHeader: CustomHeader?
    private var content: Content

    init(
        navigationBarTitle: Binding<String>,
        title: String,
        customHeader: (() -> CustomHeader)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._navigationBarTitle = navigationBarTitle
        self.title = title
        self.customHeader = customHeader?()
        self.content = content()
    }

    var body: some View {
        ScrollViewWithOffset(offsetChanged: offsetChanged) {
            LazyVStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading) {
                    if let customHeader = customHeader {
                        customHeader
                    }
                    Text(title)
                        .font(.title)
                        .bold()
                        .padding(.horizontal)
                }
                    .readSize { size in
                        headerHeight = size.height
                    }
                content
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            }
        }
    }

    private func offsetChanged(to point: CGPoint) {
        let offsetY = point.y
        if offsetY < 0 {
            let totalHeaderHeight = headerHeight + 8 // observed extra height
            navigationBarTitle = (abs(offsetY) > totalHeaderHeight) ? title : ""
        }
    }
}

/// Support for optional header from https://stackoverflow.com/a/62975146
extension ScrollingLazyVStack where CustomHeader == EmptyView {
    init(
        navigationBarTitle: Binding<String>,
        title: String,
        @ViewBuilder content: () -> Content
    ) {
        self._navigationBarTitle = navigationBarTitle
        self.title = title
        self.content = content()
        self.customHeader = nil
    }
}
