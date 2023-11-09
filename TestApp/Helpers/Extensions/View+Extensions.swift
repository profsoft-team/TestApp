//
//  View+Extensions.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import SwiftUI

extension View {
    
    func horizontalSwipe(onChangedWidth: @escaping (CGFloat) -> Void,
                         onEnded: @escaping () -> Void,
                         onDelete: @escaping () -> Void) -> some View {
        self
            .gesture(DragGesture(minimumDistance: 20, coordinateSpace: .local)
                .onChanged({ value in
                    onChangedWidth(value.translation.width)
                })
                .onEnded { value in
                    let width = value.translation.width
                    let isDelete = (width > 30 || width < -60)
                    onEnded()
                    if isDelete {
                        onDelete()
                    }
                }
            )
    }
}
