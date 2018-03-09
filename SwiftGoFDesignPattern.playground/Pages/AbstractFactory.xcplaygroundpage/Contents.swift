import Foundation

/*:
 **Example**
 */


// protocols
protocol Decimal {
    func stringValue() -> String
    static func make(string: String) -> Decimal
}

typealias NumberFactory = (String) -> Decimal

struct NextStepNumber: Decimal {
    private var nextStepNumber: NSNumber
    
    func stringValue() -> String {
        return nextStepNumber.stringValue
    }
    
    static func make(string: String) -> Decimal {
        return NextStepNumber(nextStepNumber: NSNumber(value: (string as NSString).longLongValue))
    }
}

struct SwiftNumber: Decimal {
    private var swiftInt: Int
    
    func stringValue() -> String {
        return "\(swiftInt)"
    }
    
    static func make(string: String) -> Decimal {
        return SwiftNumber(swiftInt: (string as NSString).integerValue)
    }
}


//Abstract factory
enum NumberType {
    case nextStep, swift
}

enum NumberHelper {
    static func factory(for type: NumberType) -> NumberFactory {
        switch type {
        case .nextStep:
            return NextStepNumber.make
        case .swift:
            return SwiftNumber.make
        }
    }
}

/*:
 **Usage**
 */


let nextStepFactory = NumberHelper.factory(for: .nextStep)
let numberOne = nextStepFactory("1")
numberOne.stringValue()

let swiftFactory = NumberHelper.factory(for: .swift)
let numberTwo = swiftFactory("1")
numberTwo.stringValue()

//: [Next](@next)
