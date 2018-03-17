//: [Previous](@previous)

import Foundation

/*:
 **Example**
 */

// component
protocol Shape {
    func draw(fillColor: String)
}

// leaf
final class Square: Shape {
    func draw(fillColor: String) {
        print("Drawing a square with color \(fillColor)")
    }
}

final class Circle: Shape {
    func draw(fillColor: String) {
        print("Drawing a circle with color \(fillColor)")
    }
}

// composite
final class Whiteboard: Shape {
    lazy var shapes = [Shape]()
    
    init(_ shapes: Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

/*:
 **Usage**
 */

let whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor: "red")

//: [Next](@next)
