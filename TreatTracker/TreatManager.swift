//
//  TreatManager.swift
//  TreatTracker
//
//  Created by Chris Gonzales on 6/30/14.
//
//

import UIKit

class TreatManager: NSObject {
//    instance variable
    var treatList = Treat[]()
    
//    singleton
    class var sharedInstance : TreatManager {
    struct Static {
        static let instance : TreatManager = TreatManager()
        }
        return Static.instance
    }
    
//    helper methods
    func addTreat(#newTreat: Treat) {
        treatList += newTreat
    }
    
    func removeTreatAtIndex(index: Int) {
        treatList.removeAtIndex(index)
    }
    
    var treatCount:Int {
        return treatList.count
    }
}
