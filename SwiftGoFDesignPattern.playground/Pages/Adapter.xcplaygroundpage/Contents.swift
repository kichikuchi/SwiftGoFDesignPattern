//: [Previous](@previous)

import Foundation

/*:
 **Example**
 */

protocol OlderDeathStarSuperLaserAiming {
    var angleV: NSNumber { get }
    var angleH: NSNumber { get }
}

// Adaptee
struct DeathStarSuperLaserTarget {
    let angleHorizontal: Double
    let angleVertical: Double
    
    init(angleHorizontal: Double, angleVertical: Double) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}


// Adapter
struct OldDeathStarSuperLaserTarget: OlderDeathStarSuperLaserAiming {
    private let target: DeathStarSuperLaserTarget
    
    var angleV: NSNumber {
        return NSNumber(value: target.angleVertical)
    }
    
    var angleH: NSNumber {
        return NSNumber(value: target.angleHorizontal)
    }
    
    init(_ target: DeathStarSuperLaserTarget) {
        self.target = target
    }
}

/*:
 **Usage**
 */

let target = DeathStarSuperLaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
let oldFormat = OldDeathStarSuperLaserTarget(target)

oldFormat.angleH
oldFormat.angleV

//: [Next](@next)
