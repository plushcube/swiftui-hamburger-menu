//
//  SideMenuItem.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/24/22.
//

import Foundation

struct SideMenuItem<Id: Hashable>: Identifiable {
    let id: Id
    let icon: String
    let title: String
}
