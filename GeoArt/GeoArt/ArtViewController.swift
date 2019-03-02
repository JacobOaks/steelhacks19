//
//  Art.swift
//  GeoArt
//
//  Created by Jacob Oaks on 3/1/19.
//  Copyright © 2019 Cloe. All rights reserved.
//

import Foundation
import UIKit

class ArtViewController: UIViewController {
    
    //longitude and latitude values
    var long: Double = 0
    var lat: Double = 0
    
    //didLoad function - runs when view loads
    override func viewDidLoad() {
        super.viewDidLoad() //super
        let a = 8 //any # from 0-9 for red
        let b = 5 //any # from 0-9 for green
        let c = 2 //any # from 0-9 for blue
        
        print(long)
        print(lat)
        
        let redBack:CGFloat = CGFloat((a / 9)*225)
        let greenBack:CGFloat = CGFloat((b / 9)*225)
        let blueBack:CGFloat = CGFloat((c / 9)*225)
        
        self.view.backgroundColor = UIColor(red: redBack, green: greenBack, blue: blueBack, alpha: 1)
    }
}
