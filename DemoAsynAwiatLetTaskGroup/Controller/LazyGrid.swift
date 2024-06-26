//
//  LazyGrid.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 27/03/24.
//

import SwiftUI

struct LazyGrid: View {
 
    /// Array Detail
     @State var arrDetail: [PatientDetail]
    var body: some View {
        
        ScrollView{
            HStack(alignment: .top,spacing: 10, content: {
                LazyVStack(content: {
                    ForEach(1...4, id: \.self) { count in
                        Rectangle()
                        .fill(Color.init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                            .frame(width: (UIScreen.main.bounds.size.width - 40)/2,height: .random(in: 180...240))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                })
                LazyVStack(content: {
                    ForEach(1...3, id: \.self) { count in
                        Rectangle()
                        .fill(Color.init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                            .frame(width: (UIScreen.main.bounds.size.width - 40)/2,height: .random(in: 180...250))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    }
                })
            })
        }
        .padding([.trailing,.leading],20)
        
       /* ScrollView(.horizontal) {
            LazyHStack(spacing: 0)  {
                ForEach(0...10, id:  \.self) { _ in
                    ZStack {
                       
                        RoundedRectangle(cornerRadius: 16,style: .continuous)
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.size.width - 60),height: (UIScreen.main.bounds.size.height - 140))
                        .shadow(radius: 3)
                      
                        VStack {
                            Rectangle()
                            .fill(Color.init(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1)))
                            .frame(width: (UIScreen.main.bounds.size.width - 60),height: (UIScreen.main.bounds.size.height - 140))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()
            
        }
        .scrollTargetBehavior(.viewAligned)
        .scrollTransition(.animated, axis: .horizontal) { content, phase in
            content
                .opacity(phase.isIdentity ? 1.0 : 0.8)
                .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
        }
        .onAppear(perform: {
            Task.detached(operation: {
                await APIManagerWithActor.sharedManager.getListOfPatientList()
            })
        })
        .scrollIndicators(.hidden)*/

    }
}

#Preview {
    LazyGrid(arrDetail: [])
}
