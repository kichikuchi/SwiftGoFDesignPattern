//: [Previous](@previous)

import Foundation

/*:
 **Example**
 */

protocol ICodeGenerator {
    func crossCompile()
}

protocol IGeneratorPhases {
    func collectSource()
    func crossCompile()
}

class CodeGenerator: ICodeGenerator {
    var delegate: IGeneratorPhases
    
    init(delegate: IGeneratorPhases) {
        self.delegate = delegate
    }
    
    private func fetchDataforGeneration() {
        print("fetchDataforGeneration invoked")
    }
    
    final func crossCompile() {
        fetchDataforGeneration()
        delegate.collectSource()
        delegate.crossCompile()
    }
}

class HTMLGeneratorPhases: IGeneratorPhases {
    func collectSource() {
        print("HTMLGeneratorPhases collectSource() executed")
    }
    
    func crossCompile() {
        print("HTMLGeneratorPhases crossCompile() executed")
    }
}

class JSONGeneratorPhases: IGeneratorPhases {
    func collectSource() {
        print("JSONGeneratorPhases collectSource() executed")
    }
    
    func crossCompile() {
        print("JSONGeneratorPhases crossCompile() executed")
    }
}

/*:
 **Usage**
 */

let htmlGen: ICodeGenerator = CodeGenerator(delegate: HTMLGeneratorPhases())
let jsonGen: ICodeGenerator = CodeGenerator(delegate: JSONGeneratorPhases())

htmlGen.crossCompile()
jsonGen.crossCompile()

//: [Next](@next)
