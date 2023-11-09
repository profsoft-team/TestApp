//
//  GeneralView.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import SwiftUI

struct GeneralView: View {
    
    @StateObject var viewModel = GeneralViewModel()
    
    var body: some View {
        VStack {}
        .safeAreaInset(edge: .bottom, content: bottomMenu)
        .background(background)
        .preferredColorScheme(.light)
    }
}

private extension GeneralView {
    
    func bottomMenu() -> some View {
        BottomMenu(items: $viewModel.output.menuItems,
                   deleteSubject: viewModel.input.deleteItemSubject,
                   recreateSubject: viewModel.input.recreateSubject)
    }
    
    var background: some View {
        Image(.background)
            .resizable()
            .scaledToFill()
            .ignoresSafeArea()
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
