//
//  Types+Enums.swift
//  
//
//  Created by Marat Mikaelyan on 19.03.2023.
//

import SwiftUI

struct Screen: Identifiable, Equatable {
    let id: UUID
    let view: AnyView
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        lhs.id == rhs.id
    }
}

public enum NavigationPopType {
    case previous
    case root
}
