//: [Previous](@previous)

import Foundation

/*:
 **Example**
 */

protocol PlanetVisitor {
    func visit(planet: PlanetAlderaan)
    func visit(planet: PlanetCoruscant)
    func visit(planet: PlanetTatooine)
    func visit(planet: MoonJedah)
}

protocol Planet {
    func accept(visitor: PlanetVisitor)
}

class MoonJedah: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

class PlanetAlderaan: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

class PlanetCoruscant: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

class PlanetTatooine: Planet {
    func accept(visitor: PlanetVisitor) {
        visitor.visit(planet: self)
    }
}

class NameVisitor: PlanetVisitor {
    var name = ""

    func visit(planet: PlanetAlderaan) {
        name = "Alderaan"
    }
    
    func visit(planet: PlanetCoruscant) {
        name = "PlanetCoruscant"
    }

    func visit(planet: PlanetTatooine) {
        name = "PlanetTatooine"
    }

    func visit(planet: MoonJedah) {
        name = "MoonJedah"
    }
}

/*:
 **Usage**
 */

let planets: [Planet] = [PlanetAlderaan(), PlanetCoruscant(), PlanetTatooine(), MoonJedah()]
let names = planets.map { planet -> String in
    let visitor = NameVisitor()
    planet.accept(visitor: visitor)
    return visitor.name
}

names

//: [Next](@next)
