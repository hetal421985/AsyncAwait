//
//  SwiftUIView.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 11/04/24.
//

import SwiftUI

@Observable
class IOS17Update {
    var name: String = ""
}

struct ParentView: View {
    
    @State var obj17Update = IOS17Update()

    var body: some View {
        ChildView(name: obj17Update)
        Text(obj17Update.name)
    }
}

struct ChildView: View {
    
    @Bindable var name: IOS17Update

    var body: some View {
        TextField("Enter your name", text: $name.name)
        .textFieldStyle(.roundedBorder)
        .padding(20)
    }
}

#Preview {
    ParentView()
}
