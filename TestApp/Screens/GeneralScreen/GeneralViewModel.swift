//
//  GeneralViewModel.swift
//  TestApp
//
//  Created by Дмитрий Яровой on 11/8/23.
//

import Foundation
import Combine

final class GeneralViewModel: ObservableObject {
    
    let input = Input()
    @Published var output = Output()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        bind()
    }
    
}

private extension GeneralViewModel {
    
    func bind() {
        input
            .deleteItemSubject
            .sink { [weak self] item in
                self?.output.menuItems.removeAll(where: { $0.id == item.id })
            }
            .store(in: &cancellable)
        
        input.recreateSubject
            .sink { [weak self] in
                self?.output.menuItems = MenuItem.items
            }
            .store(in: &cancellable)
    }
}

extension GeneralViewModel {
    
    struct Input {
        let deleteItemSubject = PassthroughSubject<MenuItem, Never>()
        let recreateSubject = PassthroughSubject<Void, Never>()
    }
    
    struct Output {
        var menuItems = MenuItem.items
    }
}
