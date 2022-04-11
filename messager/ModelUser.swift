//
//  ModelUser.swift
//  messager
//
//  Created by Антон on 21.03.2022.
//

import Foundation
import UIKit
import MapKit

class ModelUser {
    var users = [[User]]()
    
    init() {
        setup()
    }
    
    func setup() {
        let manOne = User(name: "Антон", city: "Krasnodar", image: UIImage(named: "imageMan")!, gender: .male, coordinate: CLLocationCoordinate2D(latitude: 37.768814, longitude: -122.434417))
        let manTwo = User(name: "Игорь", city: "Volzhsky", image: UIImage(named: "imageMan")!, gender: .male, coordinate: CLLocationCoordinate2D(latitude: 37.752834, longitude: -122.405417))
        
        let manArray = [manOne, manTwo]
        
        let womanOne = User(name: "Валя", city: "Krasnodar", image: UIImage(named: "imageWom")!, gender: .female, coordinate: CLLocationCoordinate2D(latitude: 37.775834, longitude: 122.409417))
        let womanTwo = User(name: "Ира", city: "Volzhsky", image: UIImage(named: "imageWom")!, gender: .female, coordinate: CLLocationCoordinate2D(latitude: 37.715834, longitude: 122.421417))
        
        let womanArray = [womanOne, womanTwo]
        
    users.append(manArray)
    
    users.append(womanArray)
    
    }
}
