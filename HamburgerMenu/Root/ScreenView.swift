//
//  ScreenView.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/25/22.
//

import SwiftUI

struct ScreenView<Content: View>: View {
    let menuAction: () -> Void
    @ViewBuilder let content: () -> Content

    @Environment(\.presentationMode) private var mode

    var body: some View {
        content()
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if mode.wrappedValue.isPresented {
                        backButton
                    } else {
                        menuButton
                    }
                }
            }
    }
}

private extension ScreenView {
    @ViewBuilder var backButton: some View {
        Button {
            mode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .foregroundColor(.primary)
        }
    }

    @ViewBuilder var menuButton: some View {
        Button {
            menuAction()
        } label: {
            Image(systemName: "line.3.horizontal")
                .foregroundColor(.primary)
        }
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView(menuAction: {}) {
            Text("Hello, World")
        }
    }
}
