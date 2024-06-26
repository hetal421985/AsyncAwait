//
//  HomeView.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 20/03/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var arrOptionName = [Shakes(id: 1, name: "Cocktail", selected: true),Shakes(id: 2, name: "Mocktail", selected: false),Shakes(id: 3, name: "Cofee", selected: false),Shakes(id: 4, name: "Shakes", selected: false)]
    
    /// Search Text
    @State var searchText = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("ThemeColorLight"), Color("ThemeColor")]), startPoint:.leading, endPoint: .trailing)
            VStack {
                Spacer()
                    .frame(height:30)
                /// Top Header
                HStack {
                    /// Title Label
                    Text("Welcome!")
                    .foregroundStyle(.white)
                    .font(Font(UIFont.systemFont(ofSize: 35, weight: .bold)))
                    Spacer()
                    /// Back Button
                    Button {
                        
                    } label: {
                        Image("right_arrow")
                        .resizable()
                        .frame(width: 20,height: 30)
                    }
                    .tint(Color("BackgroundColor"))
                    .buttonStyle(.borderedProminent)
                    .frame(width: 50,height: 50)
                }
                .padding(20)
                /// Search Button
                VStack {
                    /// Title Label
                    Text("Shakes!")
                    .foregroundStyle(.white)
                    .font(Font(UIFont.systemFont(ofSize: 25, weight: .bold)))
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    /// Search Text Box
                    HStack {
                        /// Search Icon
                        Image("search")
                        .resizable()
                        .frame(width: 30,height: 30)
                        TextField("Search", text: $searchText)
                    }
                    .padding()
                    .frame(height: 50)
                    .background(.white, in: RoundedRectangle(cornerRadius: 10))
                }
                .padding(20)
                Spacer()
                    .frame(height:20)
                /// Detail
                HStack(alignment: .top) {
                    VStack {
                        ForEach(0..<arrOptionName.count, id: \.self) { Index in
                        
                            Optionview(shake: arrOptionName[Index])
                            .padding(25)
                            .rotationEffect(Angle(degrees: 270))
                            .onTapGesture {
                                for Index in 0 ..< arrOptionName.count {
                                    arrOptionName[Index].selected = false
                                }
                                arrOptionName[Index].selected.toggle()
                            }
                        }
                    }
                    .offset(x:-20)
                    Text("")
                    .frame(width: 2,height: 460)
                    .background(.white)
                    .offset(x:-50)
                    ScrollView {
                        DetailView()
                        DetailView()
                        DetailView()
                    }
                }
            }
            .padding([.trailing,.leading],20)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
