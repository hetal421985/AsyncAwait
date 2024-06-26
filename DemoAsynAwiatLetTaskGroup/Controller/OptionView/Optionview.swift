//
//  Optionview.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 20/03/24.
//

import SwiftUI

struct Optionview: View {
    
    /// Title
    var shake: Shakes
   
    var body: some View {
        VStack{
            Text(shake.name)
                .padding(20)
                .foregroundStyle(.white)
                .font(Font(UIFont.systemFont(ofSize: 18, weight: .semibold)))
                .background(shake.selected ? Color("SelectedColor"): Color.clear,in: RoundedRectangle(cornerRadius: 10))
            }
     }
}

#Preview {
    Optionview(shake: Shakes(id: 1, name: "Cocktail", selected: true))
}
