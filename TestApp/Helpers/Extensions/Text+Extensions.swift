//
//  Text+Extensions.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import SwiftUI

extension Text {
    init(_ text: Strings, locale: Language = .english_us) {
        self.init(text.rawValue.localized(locale))
    }
}
