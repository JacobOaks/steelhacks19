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
            self.drawArea.setPos(self.long, self.lat) //set position in Drawing
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
            long = abs(long)
            let longCom = long * 100000000 //remove decimal place
            self.longA = Int(longCom).array
            
            //convert latitude toa rray
            lat = abs(lat)
            let latCom = lat * 100000000 //remove decimal place
            self.latA = Int(latCom).array
        }
        
        //setup the computational art
        func setupArt() {
            
            //parse values
            let redBack:CGFloat = CGFloat(((self.longA?[1] ?? 0) / 9)*225) //convert from int to r
            print (redBack)
            let greenBack:CGFloat = CGFloat(((self.longA?[2] ?? 0) / 9)*225) //convert from int to g
            print (greenBack)
            let blueBack:CGFloat = CGFloat(((self.longA?[3] ?? 0) / 9)*225) //convert from int to b
            print (blueBack)
            
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
            return String(self).flatMap{ Int(String($0)) }
        }
    }
