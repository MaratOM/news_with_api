//
//  NavToRootButton.swift
//  
//
//  Created by Marat Mikaelyan on 21.03.2023.
//

import SwiftUI

public struct NavToRootButton<Content>: View where Content: View {
    @EnvironmentObject var viewModel: NavigationStackViewModel
    let content: Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }
        
    public var body: some View {
        NavPopButton(type: .root) {
            content
        }
    }
}
