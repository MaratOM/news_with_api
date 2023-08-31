//
//  NavPushButton.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

public struct NavPushButton<Destination, Content>: View where Destination: View, Content: View {
    @EnvironmentObject var viewModel: NavigationStackViewModel
    let destination: Destination
    let content: Content
    
    public init(_ destination: Destination, @ViewBuilder content: @escaping () -> Content) {
        self.destination = destination
        self.content = content()
    }

    public var body: some View {
        content
            .onTapGesture {
                viewModel.push(destination)
            }
    }
}
