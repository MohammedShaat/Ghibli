//
//  UIImage+Url.swift
//  Ghibli
//
//  Created by Mohammed on 7/19/26.
//

import SwiftUI
import UniformTypeIdentifiers
import Playgrounds

extension UIImage {
    static func urlOf(_ imageName: String, confirmingTo type: UTType = .png) -> URL? {
        
        let fm = FileManager.default
        guard let dirUrl = fm.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            return nil
        }
        let imageUrl = dirUrl.appendingPathComponent(imageName, conformingTo: type)
        
        guard fm.fileExists(atPath: imageUrl.path()) else {
            guard let uiImage = UIImage(named: imageName),
                  let data = uiImage.pngData() else {
                return nil
            }
            
            guard (try? data.write(to: imageUrl)) != nil else {
                return nil
            }
            
            return imageUrl
        }
        
        return imageUrl
    }
}


#Playground {
    let url = UIImage.urlOf("poster")!
    _ = url.absoluteString
}
