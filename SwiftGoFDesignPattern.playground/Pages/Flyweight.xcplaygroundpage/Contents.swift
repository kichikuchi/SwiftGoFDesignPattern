//: [Previous](@previous)

import Foundation

/*:
 **Example**
 */

final class SpecialityCoffee: CustomStringConvertible {
    var origin: String
    var description: String {
        return origin
    }
    
    init(origin: String) {
        self.origin = origin
    }
}


final class Menu {
    private var coffeeAvailable: [String: SpecialityCoffee] = [:]
    
    func lookup(origin: String) -> SpecialityCoffee? {
        if coffeeAvailable.index(forKey: origin) == nil {
            coffeeAvailable[origin] = SpecialityCoffee(origin: origin)
        }
        
        return coffeeAvailable[origin]
    }
}

final class CoffeeShop {
    private var orders: [Int: SpecialityCoffee] = [:]
    private var menu = Menu()
    
    func takeOrder(origin: String, table: Int) {
        orders[table] = menu.lookup(origin: origin)
    }
    
    func serve() {
        for (table, origin) in orders {
            print("Serving \(origin) to \(table)")
        }
    }
}

/*:
 **Usage**
 */

let coffeeShop = CoffeeShop()
coffeeShop.takeOrder(origin: "Yirgacheffe, Ethiopia", table: 1)
coffeeShop.takeOrder(origin: "Buziraguhindwa, Burundi", table: 3)
coffeeShop.serve()

//: [Next](@next)
