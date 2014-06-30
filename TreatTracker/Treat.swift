//
//  Treat.swift
//  TreatTracker
//
//  Created by Chris Gonzales on 6/30/14.
//
//

import UIKit

class Treat: NSObject {
   
    var name: String
    var count: Int = 0
    var color: UIColor!
    
    init(name: String) {
        self.name = name
        super.init()
        color = generateColor()
    }
    
    func generateColor() -> UIColor {
        let hue = Double(arc4random()%256)/256.0
        let saturation = Double(arc4random()%128)/256.0 + 0.5
        let brightness = Double(arc4random()%128)/256.0 + 0.5
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 0.06)
    }
}
