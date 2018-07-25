//
//  Utils.swift
//  Algorithms
//
//  Created by Santiago Carmona Gonzalez on 3/17/18.
//  Copyright © 2018 Santiago Carmona Gonzalez. All rights reserved.
//

import Foundation

class Utils {
    static func test(algorithm: String, closure: (() -> Void)) {
        let start = DispatchTime.now() // <<<<<<<<<< Start time
        closure()
        let end = DispatchTime.now()   // <<<<<<<<<<   end time
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
        print("""

            <<<<<
            ------------------------------------
            ------------------------------------
            ------------------------------------

            Time to evaluate \(algorithm) \(timeInterval) seconds

            ------------------------------------
            ------------------------------------
            ------------------------------------
            >>>>>

            """
        )
    }
    
   
}
