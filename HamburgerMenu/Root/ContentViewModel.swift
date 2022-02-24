//
//  ContentViewModel.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/25/22.
//

import Combine

final class ContentViewModel: ObservableObject {
    @Published var sideMenuViewModel = SideMenuViewModel()

    var currentMenuId: MenuId? {
        get { sideMenuViewModel.selectedItemId }
        set { sideMenuViewModel.selectedItemId = newValue }
    }

    private var bag: Set<AnyCancellable> = []

    init() {
        sideMenuViewModel.$selectedItemId
            .sink { _ in self.objectWillChange.send() }
            .store(in: &bag)
    }

    func showSideMenu() {
        sideMenuViewModel.shouldShowSideMenu = true
    }
}
