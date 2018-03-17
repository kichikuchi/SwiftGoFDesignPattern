//: [Previous](@previous)

import Foundation


// protection proxy

/*:
 **Example**
 */

protocol DoorOperator {
    func open(doors: String) -> String
}

class HAL9000: DoorOperator {
    func open(doors: String) -> String {
        return "HAL9000: Affirmative, Dave. I read you. Opend \(doors)."
    }
}

class CurrentComputer: DoorOperator {
    private var computer: HAL9000!
    
    func authenticate(password: String) -> Bool {
        guard password == "pass" else {
            return false
        }
        
        computer = HAL9000()
        return true
    }
    
    func open(doors: String) -> String {
        guard computer != nil else {
            return "Access Denied. I'm afraid I can't do that."
        }
        
        return computer.open(doors: doors)
    }
}

/*:
 **Usage**
 */

let computer = CurrentComputer()
let podBay = "Pod Bay Doors"

computer.open(doors: podBay)

computer.authenticate(password: "pass")
computer.open(doors: podBay)

// virtual proxy

/*:
 **Example**
 */

protocol HEVSuitMedicalAid {
    func administerMorphine() -> String
}

class HEVSuit: HEVSuitMedicalAid {
    func administerMorphine() -> String {
        return "Morphine administered."
    }
}

class HEVSuitHumanInterface: HEVSuitMedicalAid {
    lazy private var physicalSuit = HEVSuit()
    
    func administerMorphine() -> String {
        return physicalSuit.administerMorphine()
    }
}

/*:
 **Usage**
 */

let humanInterface = HEVSuitHumanInterface()
humanInterface.administerMorphine()

//: [Next](@next)
