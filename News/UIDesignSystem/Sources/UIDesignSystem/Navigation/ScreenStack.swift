//
//  ScreenStack.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import Foundation

struct ScreenStack {
    private var stack = [Screen]()
    
    mutating func top() -> Screen? {
        stack.last
    }
    
    mutating func push(screen: Screen) {
        stack.append(screen)
    }
    
    mutating func pop() {
        _ = stack.popLast()
    }
    
    mutating func popTo(id: UUID) -> Screen? {
        stack.filter { $0.id == id }.first
    }
    
    mutating func popToRoot() {
        stack.removeAll()
    }
}


