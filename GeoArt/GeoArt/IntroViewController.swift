//
//  Intro.swift
//  GeoArt
//
//  Created by Clare C on 3/2/19.
//  Copyright © 2019 Cloe. All rights reserved.
//

import Foundation
import UIKit
class IntroController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
    }
    
    @objc func handleSwipe(_ sender:UISwipeGestureRecognizer) {
        if (sender.direction == .up) {
            performSegue(withIdentifier: "IntroSegue", sender: self)
        }
    }
}
