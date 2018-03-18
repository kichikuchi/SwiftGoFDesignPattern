//: [Previous](@previous)

import Foundation

/*:
 **Example**
 */

protocol PrintStrategy {
    func print(_ string: String) -> String
}

final class Printer {
    private let strategy: PrintStrategy
    
    func print(_ string: String) -> String {
        return strategy.print(string)
    }
    
    init(strategy: PrintStrategy) {
        self.strategy = strategy
    }
}

final class UpperCaseStrategy: PrintStrategy {
    func print(_ string: String) -> String {
        return string.uppercased()
    }
}

final class LowerCaseStrategy: PrintStrategy {
    func print(_ string: String) -> String {
        return string.lowercased()
    }
}

/*:
 **Usage**
 */

var lower = Printer(strategy: LowerCaseStrategy())
lower.print("0 tempora, o mores!")

var upper = Printer(strategy: UpperCaseStrategy())
upper.print("0 tempora, o mores!")

//: [Next](@next)
