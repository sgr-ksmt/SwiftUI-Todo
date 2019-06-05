//
//  ContentView.swift
//  TodoExample
//
//  Created by suguru-kishimoto on 2019/06/05.
//  Copyright © 2019 suguru-kishimoto. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        TaskListView()
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
