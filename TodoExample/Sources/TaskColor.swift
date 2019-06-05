//
//  TaskColor.swift
//  TodoExample
//
//  Created by suguru-kishimoto on 2019/06/05.
//  Copyright © 2019 suguru-kishimoto. All rights reserved.
//

import SwiftUI

enum TaskColor: CaseIterable {
    case red
    case green
    case blue
    case yellow

    var color: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .yellow: return .yellow
        }
    }

    static var `default`: TaskColor {
        return .red
    }

    static var random: TaskColor {
        return TaskColor.allCases.randomElement()!
    }
}
