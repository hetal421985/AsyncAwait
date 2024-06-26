//
//  DetailView.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 22/03/24.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(width: 170,height: 220)
                .clipShape(.rect(
                    topLeadingRadius: 120,
                    bottomLeadingRadius: 20,
                    bottomTrailingRadius: 20,
                    topTrailingRadius: 20))
            VStack {
                Image("oreo")
                    .resizable()
                    .aspectRatio(contentMode:.fill)
                    .offset(x:-20,y: -10)
                Text("Rose Smoothie")
                    .foregroundStyle(Color("BackgroundColor"))
                    .font(Font(UIFont.systemFont(ofSize: 25, weight: .semibold)))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .offset(y: -20)
                    .padding([.trailing,.leading],20)
                Text("$10")
                    .foregroundStyle(Color("BackgroundColor"))
                    .font(Font(UIFont.systemFont(ofSize: 25, weight: .semibold)))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .offset(y: -20)
                    .padding([.trailing,.leading],20)
            }
            
        }
        .padding(20)
    }
}

#Preview {
    DetailView()
}
