//
//  AnyTransition.swift
//  
//
//  Created by Marat Mikaelyan on 21.03.2023.
//

import SwiftUI

extension AnyTransition {
    static var slideForward: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .trailing),
            removal: .move(edge: .leading)
        )
    }
    
    static var slideBack: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .move(edge: .leading),
            removal: .move(edge: .trailing)
        )
    }
}
