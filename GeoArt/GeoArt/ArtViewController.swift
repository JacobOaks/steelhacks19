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
        self.setupSwipe() //setup swipe recognition
        self.setupArt() //setup computational art
    }
    
    //setup swipe recognition
    func setupSwipe() {
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        leftSwipe.direction = .left
        view.addGestureRecognizer(leftSwipe)
    }
    
    //setup the computational art
    func setupArt() {
        
        //interpret values from long/lat
        let a = 8 //any # from 0-9 for red
        let b = 5 //any # from 0-9 for green
        let c = 2 //any # from 0-9 for blue
        
        //print long/lat for debug purposes
        print(self.long)
        print(self.lat)
        
        //parse values
        let redBack:CGFloat = CGFloat((a / 9)*225) //convert from int to r
        let greenBack:CGFloat = CGFloat((b / 9)*225) //convert from int to g
        let blueBack:CGFloat = CGFloat((c / 9)*225) //convert from int to b
        
        //background color
        self.view.backgroundColor = UIColor(red: redBack, green: greenBack, blue: blueBack, alpha: 1)
    }
    
    //called when a swipe occurs
    @objc func handleSwipe(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            self.dismiss(animated: true, completion: nil) //return to previous screen
        }
    }
}
