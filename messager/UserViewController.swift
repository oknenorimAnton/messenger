//
//  UserViewController.swift
//  messager
//
//  Created by Антон on 22.03.2022.
//

import UIKit

class UserViewController: UIViewController {

    var user: User!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = user.name
        cityLabel.text = user.city
        imageView.image = user.image
        
        imageView.layer.borderWidth = 3.0
        
        if user.gender == .male{
            imageView.layer.borderColor = UIColor.blue.cgColor
        }else{ imageView.layer.borderColor = UIColor.red.cgColor
        }
    }
}
