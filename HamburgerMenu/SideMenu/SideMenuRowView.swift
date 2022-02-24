//
//  SideMenuRowView.swift
//  HamburgerMenu
//
//  Created by Andrei Chevozerov on 2/24/22.
//

import SwiftUI

struct SideMenuRowView: View {
    let item: SideMenuItem<MenuId>

    @Binding var isSelected: Bool

    var body: some View {
        HStack {
            Image(systemName: item.icon)
            Text(item.title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.secondary)
        }
        .foregroundColor(isSelected ? .accentColor : .primary)
        .frame(height: 44.0)
        .onTapGesture {
            self.isSelected = true
        }
    }
}

struct SideMenuRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuRowView(
            item: SideMenuItem(id: .news, icon: "newspaper", title: "News"),
            isSelected: .constant(true)
        )
    }
}
