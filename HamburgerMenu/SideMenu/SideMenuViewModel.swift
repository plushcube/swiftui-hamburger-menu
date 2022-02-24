//
//  SideMenuViewModel.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/24/22.
//

import Foundation

enum MenuId: Int {
    case news
    case stores
    case orders
    case profile
    case discounts
}

final class SideMenuViewModel: ObservableObject {
    @Published var items: [SideMenuItem<MenuId>] = [
        SideMenuItem(id: .news, icon: "newspaper", title: "News"),
        SideMenuItem(id: .stores, icon: "map", title: "Stores"),
        SideMenuItem(id: .orders, icon: "cart", title: "Orders"),
        SideMenuItem(id: .profile, icon: "person", title: "Profile"),
        SideMenuItem(id: .discounts, icon: "percent", title: "Discounts"),
    ]

    @Published var selectedItemId: MenuId? {
        didSet { shouldShowSideMenu = false }
    }
    @Published var shouldShowSideMenu: Bool = false
}
