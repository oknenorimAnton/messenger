//
//  PhotoGallery.swift
//  messager
//
//  Created by Антон on 12.03.2022.
//

import Foundation
import UIKit

class PhotoGallery{
    var images = [UIImage]()
    init() {
        setupGallery()
    }
    func setupGallery(){
        for i in 0...7{
            let image = UIImage(named: "Image \(i)")!
            images.append(image)
        }
    }
    
}
