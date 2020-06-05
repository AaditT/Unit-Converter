//
//  UnitBrain.swift
//  Unit Converter
//
//  Created by Aadit Trivedi on 6/4/20.
//  Copyright © 2020 Aadit Trivedi. All rights reserved.
//

import Foundation

struct UnitBrain {

    let pickerData = ["Centimeter", "Inch", "Foot", "Meter", "Yard", "Mile"]
    let unitRatios = [160934, 63360, 5280, 1609, 1760, 1]
    
    func calculateOutput(myUnit: Unit) -> Double {
        
        let input: Int = myUnit.inputUnits
        let output: Int = myUnit.outputUnits
        
        let ratio: Double = Double(unitRatios[output])/Double(unitRatios[input])
        return ratio
    }

}
