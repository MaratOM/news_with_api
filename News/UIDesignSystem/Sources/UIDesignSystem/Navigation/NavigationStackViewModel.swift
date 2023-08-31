//
//  NavigationStackViewModel.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

final public class NavigationStackViewModel: ObservableObject {
    @Published var current: Screen?
    var transition: AnyTransition = .slideForward
    var direction = 0
    private var screenStack = ScreenStack() {
        didSet {
            current = screenStack.top()
        }
    }
    
    func push<V: View>(_ view: V) {
        transition = .slideBack
        direction = 0
        withAnimation {
            screenStack.push(screen: .init(id: UUID(), view: AnyView(view)))
        }
    }
    
    func pop(to destination: NavigationPopType) {
        direction = 1
        transition = .slideForward
        switch destination {
        case .previous:
            withAnimation {
                screenStack.pop()
            }
        case .root:
            withAnimation {
                screenStack.popToRoot()
            }
        }
    }
}
