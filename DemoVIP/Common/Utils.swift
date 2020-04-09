//
//  Utils.swift
//  DemoVIP
//
//  Created by Chetankumar Dobariya on 08.04.20.
//  Copyright © 2020 Chetankumar Dobariya. All rights reserved.
//


import Foundation
import UIKit

/// handle image downloading and caching

var loadedImagesCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImage(with url: URL) {
        if let cachedImage = loadedImagesCache.object(forKey:  url.absoluteString as NSString) {
            self.image = cachedImage
            return
        }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    loadedImagesCache.setObject(image, forKey: url.absoluteString as NSString)
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
