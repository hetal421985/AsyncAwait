//
//  ImageDownload.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 06/02/24.
//

import Foundation
import UIKit

final class ImageDownload  {
    
    static let sharedInstance = ImageDownload()
    
    private init(){}
    
    internal func fetchImageUsingAsyncAwait(url: String) async -> UIImage? {
        
        do {
            let (data,_) = try await URLSession.shared.data(from: URL(string: url)!)
            if let image = UIImage(data: data) {
                return image
            } else {
                return nil
            }
        } catch {}
        return nil
    }
}
