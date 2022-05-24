//
//  ThemeExtension.swift
//  TimeNoteKit
//
//  Created by Anna Zharkova on 23.05.2022.
//

import Foundation
import Intents

extension ThemeColor {
    func accentColor()->Theme {
        switch self {
        case .red:
            return .red
        case .blue:
            return .blue
        case .orange:
            return .orange
        default:
            return .red
        }
    }
}
