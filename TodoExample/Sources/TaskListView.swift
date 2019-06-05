//
//  TaskListView.swift
//  TodoExample
//
//  Created by suguru-kishimoto on 2019/06/05.
//  Copyright © 2019 suguru-kishimoto. All rights reserved.
//

import SwiftUI

struct TaskListView : View {
    @EnvironmentObject private var taskData: TaskData
    var body: some View {
        NavigationView {
            Group {
                CreateTaskView()

                Toggle(isOn: $taskData.hideDoneTasks) {
                    Text("Hide done tasks")
                    }
                    .padding(.horizontal)

                List {
                    ForEach(taskData.tasks.identified(by: \.self)) { task in
                        if !self.taskData.hideDoneTasks || !task.isDone {
                            TaskListRow(task: task)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Todo List"))
        }
    }
}

#if DEBUG
struct TaskListView_Previews : PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
#endif
