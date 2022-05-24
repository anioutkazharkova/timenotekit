//
//  Theme.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 23.05.2022.
//

import Foundation
import SwiftUI

enum Theme : String {
    case red = "Red"
    case blue = "Blue"
    case orange = "Orange"
    
    func accentColor()->Color {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .orange:
            return .orange
        }
    }
}

extension String {
    var theme: Theme {
        if self == "Red" {
            return .red
        }
        if self == "Orange" {
            return .orange
        }
        if self == "Blue" {
            return .blue
        }
        return .red
    }
}
