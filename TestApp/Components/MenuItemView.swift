//
//  MenuItemView.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import SwiftUI
import Combine

struct MenuItemView: View {
    
    let model: MenuItem
    let deleteSubject: PassthroughSubject<MenuItem, Never>
    @State var offsetX: CGFloat = 0
    
    var body: some View {
        Circle()
            .frame(width: 50)
            .foregroundColor(.green)
            .overlay(content: {
                Image(systemName: model.systemImageName)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
            })
            .offset(x: offsetX)
            .horizontalSwipe(
                onChangedWidth: { width in
                    withAnimation {
                        offsetX = width
                    }
                },onEnded: {
                    withAnimation {
                        offsetX = 0
                    }
                }, onDelete: {
                    withAnimation {
                        deleteSubject.send(model)
                    }
                })
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(model: MenuItem.items.first!,
                     deleteSubject: PassthroughSubject<MenuItem, Never>())
    }
}
