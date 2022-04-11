//
//  User.swift
//  messager
//
//  Created by Антон on 21.03.2022.
//

import Foundation
import UIKit
import MapKit

class User: NSObject, MKAnnotation {
    
    enum Gender {
        case male
        case female
    }
    var coordinate: CLLocationCoordinate2D
    var name: String
    var city: String
    var image: UIImage
    var gender: Gender
    var title: String?{
        return name
    }
    
    init(name: String, city: String, image: UIImage, gender: Gender, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.city = city
        self.image = image
        self.gender = gender
        self.coordinate = coordinate
    }
}
