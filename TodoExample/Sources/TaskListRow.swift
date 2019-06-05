//
//  TaskListRow.swift
//  TodoExample
//
//  Created by suguru-kishimoto on 2019/06/05.
//  Copyright © 2019 suguru-kishimoto. All rights reserved.
//

import SwiftUI

struct TaskListRow : View {
    @EnvironmentObject private var taskData: TaskData
    @State private var alertIsShown: Bool = false
    var task: Task

    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            if self.task.isDone {
                Image(systemName: "checkmark.square.fill").imageScale(.large)
                    .tapAction(count: 1) {
                        self.taskData.toggleDone(self.task)
                }
            } else {
                Image(systemName: "checkmark.square").imageScale(.large)
                    .tapAction(count: 1) {
                        self.taskData.toggleDone(self.task)
                }
            }

            Text(task.text).font(.title)

            Spacer()

            Image(systemName: "trash.fill").imageScale(.large)
                .disabled(false)
                .tapAction { self.alertIsShown = true }
                .presentation($alertIsShown) {
                    Alert(
                        title: Text("Confirm"),
                        message: Text("Delete this Task?\ntext: \(self.task.text)"),
                        primaryButton: .destructive(Text("Delete")) {
                            self.taskData.delete(self.task)
                        },
                        secondaryButton: .cancel()
                    )
            }
            }
            .padding()
            .background(task.color.color.opacity(0.8))
            .cornerRadius(8.0)
    }
}

#if DEBUG
struct TaskListRow_Previews : PreviewProvider {
    static var previews: some View {
        TaskListRow(task: .mock())
    }
}
#endif
