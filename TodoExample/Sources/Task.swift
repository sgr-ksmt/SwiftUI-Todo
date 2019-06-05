//
//  Task.swift
//  TodoExample
//
//  Created by suguru-kishimoto on 2019/06/05.
//  Copyright © 2019 suguru-kishimoto. All rights reserved.
//

import Foundation
import SwiftUI

struct Task: Equatable, Hashable {
    var id: String = UUID().uuidString
    var text: String
    var color: TaskColor
    var isDone: Bool = false

    static func mock() -> Task {
        .init(text: randomTaskText.randomElement()!, color: TaskColor.random)
    }
}

private let randomTaskText: [String] = [
    "Buy MacBook Pro",
    "Go Office",
    "Send E-mail to Bob",
    "Redesign website",
    "Buy iPhone X",
]
