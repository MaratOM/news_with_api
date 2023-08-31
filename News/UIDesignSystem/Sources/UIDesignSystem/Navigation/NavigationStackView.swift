//
//  NavigationStackView.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

public struct NavigationStackView<Content>: View where Content: View {
    @StateObject var viewModel: NavigationStackViewModel = .init()
    private let content: Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    public var body: some View {
        ZStack {
            if viewModel.current == nil {
                content
                    .transition(AnyTransition.asymmetric(
                        insertion:.move(edge: viewModel.direction == 0 ? .leading : .trailing),
                        removal: .move(edge: viewModel.direction == 0 ? .trailing : .leading))
                    )
                    .environmentObject(viewModel)
            } else {
                VStack(alignment: .leading) {
                    NavPopButton {
                        HStack {
                            Image(systemName: "arrowtriangle.backward")
                            Text("Back")
                        }
                    }
                    .padding(.leading, 10)
                    viewModel.current?.view
                        .transition(AnyTransition.asymmetric(
                            insertion:.move(edge: viewModel.direction == 0 ? .leading : .trailing),
                            removal: .move(edge: viewModel.direction == 0 ? .trailing : .leading))
                        )
                }
                .environmentObject(viewModel)
            }
        }
    }
}


