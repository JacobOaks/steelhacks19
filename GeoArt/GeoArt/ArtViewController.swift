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
    @IBOutlet var drawArea: Drawing!
    
    //didLoad function - runs when view loads
    override func viewDidLoad() {
        super.viewDidLoad() //super
        self.setupSwipe() //setup swipe recognition
        self.setupArt() //setup computational art
        self.drawArea.setPos(self.long, self.lat) //set position in Drawing
    }
    
    //setup swipe recognition
    func setupSwipe() {
        let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        downSwipe.direction = .down
        view.addGestureRecognizer(downSwipe)
    }
    
    //setup the computational art
    func setupArt() {
        
        //interpret a, b, c from longitude
        long = abs(long)
        print("long \(long)")
        
        let cF = long / 100 //c float
        let c = Int(cF) //c int
        let bF = (cF * 10) - (10 * Double(c)) //b float
        let b = Int(bF) //b int
        let aF = (bF * 10) - (10 * Double(b)) //a float
        let a = Int(aF) //a int
        
        //parse values
        let redBack:CGFloat = CGFloat((a / 9)*225) //convert from int to r
        let greenBack:CGFloat = CGFloat((b / 9)*225) //convert from int to g
        let blueBack:CGFloat = CGFloat((c / 9)*225) //convert from int to b
        
        //background color
        self.view.backgroundColor = UIColor(red: redBack, green: greenBack, blue: blueBack, alpha: 1)
    }
    
    //called when a swipe occurs
    @objc func handleSwipe(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .down) {
            self.dismiss(animated: true, completion: nil) //return to previous screen
        }
    }
}
