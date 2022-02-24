//
//  SideMenuView.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/24/22.
//

import SwiftUI

struct SideMenuView: View {
    @StateObject var viewModel: SideMenuViewModel

    var body: some View {
        ZStack {
            if viewModel.shouldShowSideMenu {
                List {
                    ForEach(viewModel.items) { item in
                        SideMenuRowView(
                            item: item,
                            isSelected: .init(
                                get: { viewModel.selectedItemId == item.id },
                                set: { _ in viewModel.selectedItemId = item.id })
                        )
                    }
                }
                .listStyle(.sidebar)
                .padding(.trailing, 64.0)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .leading),
                        removal: .move(edge: .leading)
                    )
                )
                .zIndex(1.0)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .animation(.default, value: viewModel.shouldShowSideMenu)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(viewModel: SideMenuViewModel())
    }
}
