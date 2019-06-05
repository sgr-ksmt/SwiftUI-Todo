//
//  TaskData.swift
//  TodoExample
//
//  Created by suguru-kishimoto on 2019/06/05.
//  Copyright © 2019 suguru-kishimoto. All rights reserved.
//

import Combine
import SwiftUI

final class TaskData: BindableObject {
    let didChange = PassthroughSubject<TaskData, Never>()

    var tasks: [Task] = [] {
        didSet {
            didChange.send(self)
        }
    }

    var hideDoneTasks: Bool = true {
        didSet {
            didChange.send(self)
        }
    }

    func index(of task: Task) -> Int {
        tasks.firstIndex { $0.id == task.id }!
    }

    func create(text: String, color: TaskColor) {
        tasks.append(Task(text: text, color: color))
    }

    func toggleDone(_ task: Task) {
        tasks[index(of: task)].isDone.toggle()
    }

    func delete(_ task: Task) {
        tasks.remove(at: index(of: task))
    }

    static func mock(size: Int = 3) -> TaskData {
        let data = TaskData()
        data.tasks = (0..<size).map { _ in Task.mock() }
        return data
    }
}
