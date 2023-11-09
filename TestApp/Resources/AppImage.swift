//
//  AppImage.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import SwiftUI

enum AppImage: String {
    case background
}

extension Image {
    init(_ image: AppImage) {
        self.init(image.rawValue)
    }
}
