//
//  BottomMenu.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import SwiftUI
import Combine

struct BottomMenu: View {
    
    @State private var isShow = false
    @Binding var items: [MenuItem]
    let deleteSubject: PassthroughSubject<MenuItem, Never>
    let recreateSubject: PassthroughSubject<Void, Never>
    
    var offsets: [CGFloat] {
        var array: [CGFloat] = []
        let firstOffset: CGFloat = -66
        let step: CGFloat = 60
        array.append(firstOffset)
        while array.count != items.count {
            let last = array.last ?? firstOffset
            let offset = last - step
            array.append(offset)
        }
        return array
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack { }.frame(maxHeight: .infinity)
            menuItems
            menu
        }
    }
}

private extension BottomMenu {
    
    var menu: some View {
        HStack(alignment: .center) {
            Spacer()
            Text(.menu)
                .foregroundColor(.white)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .border(.white, width: 2)
                .onTapGesture(perform: menuButtonTap)
                .padding(.horizontal, 8)
        }
        .frame(height: 56)
        .background(Color.green)
    }
    
    var menuItems: some View {
        ForEach(Array(items.enumerated()), id: \.element) { item in
            MenuItemView(model: item.element, deleteSubject: deleteSubject)
                .offset(y: isShow ? offsets[item.offset] : 0)
                .animation(Animation.easeInOut(duration: 0.5), value: isShow)
                .padding(.horizontal)
                .transition(.scale)
        }
    }
}

private extension BottomMenu {
    
    func menuButtonTap() {
        isShow.toggle()
        if items.isEmpty {
            recreateSubject.send()
            withAnimation {
                isShow.toggle()
            }
        }
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu(items: .constant(MenuItem.items),
                   deleteSubject: PassthroughSubject<MenuItem, Never>(),
                   recreateSubject: PassthroughSubject<Void, Never>())
    }
}
