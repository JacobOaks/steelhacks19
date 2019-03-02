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
        
        //data
        var long: Double = 0 //longitude
        var longA: [Int]? //array of longitude digits
        var lat: Double = 0 //latitude
        var latA: [Int]? //array of latitude digits
        @IBOutlet var drawArea: Drawing! //reference to drawing view area
        
        //didLoad function - runs when view loads
        override func viewDidLoad() {
            super.viewDidLoad() //super
            self.setupSwipe() //setup swipe recognition
            self.setupArrays() //convert long and lat to arrays
            self.drawArea.setPos(self.longA!, self.latA!) //set position in Drawing
            self.setupArt() //setup computational art
        }
        
        //setup swipe recognition
        func setupSwipe() {
            let downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
            downSwipe.direction = .down
            view.addGestureRecognizer(downSwipe)
        }
        
        //convert long and lat to array
        func setupArrays() {
            
            //set long and lat to arrays of 0 by default
            self.longA = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] //0s by default
            self.latA = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] //0s by default
            
            var extraLatZeros = 0
            if (self.lat < 10) { extraLatZeros = extraLatZeros + 1 }
            if (self.lat < 100) { extraLatZeros = extraLatZeros + 1 }
            
            var extraLongZeros = 0
            if (self.long < 10) { extraLongZeros = extraLongZeros + 1 }
            if (self.long < 100) { extraLongZeros = extraLongZeros + 1 }
            
            //create long array
            long = abs(long)
            let longCom = long * 100000000 //remove decimal place
            let longArr = Int(longCom).array
            
            //fill in long
            var i = extraLongZeros
            for digit in longArr {
                self.longA?[i] = digit
                i = i + 1
            }
            
            //convert latitude toa rray
            lat = abs(lat)
            let latCom = lat * 100000000 //remove decimal place
            let latArr = Int(latCom).array
            
            //fill in lat
            i = extraLatZeros
            for digit in latArr {
                self.latA?[i] = digit
                i = i + 1
            }
        }
        
        //setup the computational art
        func setupArt() {
            
            //parse values
            let redBack:CGFloat = CGFloat(((self.longA?[1] ?? 0) / 9)*225) //convert from int to r
            let greenBack:CGFloat = CGFloat(((self.longA?[2] ?? 0) / 9)*225) //convert from int to g
            let blueBack:CGFloat = CGFloat(((self.longA?[3] ?? 0) / 9)*225) //convert from int to b
            
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

    extension Int {
        var array: [Int] {
            return String(self).compactMap{ Int(String($0)) }
        }
    }
