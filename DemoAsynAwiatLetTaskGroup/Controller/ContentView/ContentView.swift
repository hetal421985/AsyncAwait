//
//  ContentView.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 06/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var data: [UIImage]
    private let adaptiveColumn = [
        GridItem(.fixed((UIScreen.main.bounds.size.width/2.3))),GridItem(.fixed((UIScreen.main.bounds.size.width/2.3)))
       ]
    var body: some View {
       
       ScrollView {
           
           HStack(alignment: .top, content: {
               LazyVStack {
                   ForEach(data, id: \.self) { item in
                        Image(uiImage: item)
                        .frame(width: (UIScreen.main.bounds.size.width/2.3), height:.random(in: 180...240), alignment: .center)
                        .cornerRadius(10)
                  }
                }
               LazyVStack {
                   ForEach(data, id: \.self) { item in
                        Image(uiImage: item)
                        .frame(width: (UIScreen.main.bounds.size.width/2.3), height: .random(in: 170...250), alignment: .center)
                        .cornerRadius(10)
                   }
               }
           })
        }.padding(0)
        .onAppear(perform: {
            demoSemaphore()
            demoDispatchGroup()
           /* DispatchQueue.global(qos: .background).async {
                print(1) /// lowest priority
            }
            DispatchQueue.global(qos: .userInitiated).async {
                print(2) /// 1 Highest Priority
            }
            DispatchQueue.global(qos: .userInteractive).async {
                print(3)/// 2 Highest Priority
            }
            DispatchQueue.global(qos: .utility).async {
                print(4)/// second lowest priority
            }
            DispatchQueue.global(qos: .default).async {
                print(5)/// 3rd Highest Priority
            }
            
            DispatchQueue.global(qos: .unspecified).async {
                print(6)/// 4th Highest Priority
            }*/
            /// In following example  all Async call
            /// to fetch image is added in Task
            /// so all images will be downloaded in serial way
            Task {
                let image1 = await ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")!
                data.append(image1)
                
                let image2 = await ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")!
                data.append(image2)
                
                let image3 = await ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")!
                data.append(image3)
                
                let image4 = await ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")!
                data.append(image4)
            }
            /// to overcome from situtaion where instead of calling serial
            /// it should be called parellaly async let comes in picture
            
            Task {
                async let fetchImage1 =  ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")
                async let fetchImage2 =  ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")
                async let fetchImage3 =  ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")
                async let fetchImage4 =  ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: "https://picsum.photos/200/300")
                
                let (image1,image2,image3,image4) = await (fetchImage1,fetchImage2,fetchImage3,fetchImage4)
                data.append(contentsOf: [image1!,image2!,image3!,image4!])
                
            }
            /// This is example of few images which are downloading images
            /// parellaly but what about if there are number of records for this
            /// Task Group comes in the picture.
            Task {
                await data.append(contentsOf: downloadImageUsingTaskGroup())
            }
        })
    }
    
    /*
     This function will give demostration of Task Group
     */
    fileprivate func downloadImageUsingTaskGroup() async -> [UIImage] {
        /// Array URL
        let arrURL = ["https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300","https://picsum.photos/200/300"]
        
        var arrImages: [UIImage] = []
        arrImages.reserveCapacity(arrURL.count)
        
        do {
            try await withThrowingTaskGroup(of: UIImage.self) { group in
               for url in arrURL {
                   group.addTask {
                       await ImageDownload.sharedInstance.fetchImageUsingAsyncAwait(url: url)!
                   }
               }
               for try await image in group {
                   arrImages.append(image)
               }
           }
        } catch {}
        return arrImages
    }
    
    private func demoSemaphore() {
        
        let semaphoreQueue = DispatchQueue(label: "com.semaphore",attributes: .concurrent)
        
        let semaphore = DispatchSemaphore(value: 1)
        
        semaphore.wait()
        semaphoreQueue.async {
            print("Semaphore Excute One...")
            semaphore.signal()
        }
        semaphore.wait()
        semaphoreQueue.async {
            print("Semaphore Excute Two...")
            semaphore.signal()
        }
    }
    
    private func demoDispatchGroup() {
        
        let groupQueue = DispatchQueue(label: "com.semaphore",attributes: .concurrent)
        
        let group = DispatchGroup()
        
        group.enter()
        groupQueue.async {
            print("Dispatch Group Excute One...")
            group.leave()
        }
        group.enter()
        groupQueue.async {
            print("Dispatch Group Excute Two...")
            group.leave()
        }
        group.notify(queue: DispatchQueue.main) {
         print("All tasks are finished. Display the results here.")
        }
    }
}

#Preview {
    ContentView(data: [])
}
