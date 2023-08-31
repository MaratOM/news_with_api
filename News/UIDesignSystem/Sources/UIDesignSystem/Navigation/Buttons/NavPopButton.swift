//
//  NavPopButton.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

public struct NavPopButton<Content>: View where Content: View {
    @EnvironmentObject var viewModel: NavigationStackViewModel
    let type: NavigationPopType
    let content: Content
    
    public init(type: NavigationPopType = .previous, @ViewBuilder content: @escaping () -> Content) {
        self.type = type
        self.content = content()
    }
        
    public var body: some View {
        content
            .onTapGesture {
                viewModel.pop(to: type)
            }
    }
}
