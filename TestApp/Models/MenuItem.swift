//
//  MenuItem.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import Foundation

struct MenuItem: Identifiable, Hashable {
    let id = UUID()
    let systemImageName: String
}

extension MenuItem {
    
    static var items: [MenuItem] {
        [
            MenuItem(systemImageName: "lineweight"),
            MenuItem(systemImageName: "clock"),
            MenuItem(systemImageName: "magnifyingglass"),
            MenuItem(systemImageName: "house.fill"),
            MenuItem(systemImageName: "gear"),
        ]
    }
}
