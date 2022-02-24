//
//  ContentView.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/24/22.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        ZStack {
            NavigationView {
                ScreenView(menuAction: viewModel.showSideMenu) {
                    MainView()
                }
                .background(navigation)
            }

            SideMenuView(viewModel: viewModel.sideMenuViewModel)
        }
    }

    @ViewBuilder private var navigation: some View {
        VStack {
            link(for: .news) { NewsView() }
            link(for: .stores) { StoresView() }
            link(for: .orders) { OrdersView() }
            link(for: .profile) { ProfileView() }
            link(for: .discounts) { DiscountsView() }
        }
        .hidden()
    }

    @ViewBuilder private func link<V: View>(for id: MenuId, @ViewBuilder content: @escaping () -> V) -> some View {
        NavigationLink("",
            destination: ScreenView(menuAction: viewModel.showSideMenu, content: content),
            tag: id,
            selection: $viewModel.currentMenuId
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
