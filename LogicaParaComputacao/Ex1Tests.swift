//
//  Ex1Tests.swift
//  LogicaParaComputacao
//
//  Created by Academy on 22/11/20.
//


class Ex1Tests {
    
    func testNumberOfAtoms() -> Bool {
        
        // Given
        let formula = Implies(Atom("a"), Or(Atom("c"), Atom("d")))
        let formula2 = Implies(Atom("e"), Or(Atom("f"), Atom("g")))
        let formula3 = Implies(Atom("k"), Or(Atom("b"), Atom("y")))
        
        let completeFormula = Implies(formula, Implies(formula2, formula3))
        print(completeFormula.description)
        
        // When
        let result = numberOfAtoms(from: completeFormula)
        
        // Then
        print(result)
        return result == 9
    }
    
    func testNumberOfConnectives() -> Bool {
        
        // Given
        let formula = Implies(Atom("a"), Or(Atom("c"), Atom("d")))
        let formula2 = Implies(Atom("e"), Or(Atom("f"), Atom("g")))
        let formula3 = Implies(Atom("k"), Or(Atom("b"), Atom("y")))
        
        let completeFormula = Implies(formula, Implies(formula2, formula3))
        print(completeFormula.description)
        
        // When
        let result = numberOfConnectives(from: completeFormula)
        
        // Then
        print(result)
        return result == 6
    }
    
    func testGetAtoms() -> Bool {
        
        // Given
        let formula = Implies(Atom("a"), Or(Atom("c"), Atom("d")))
        let formula2 = Implies(Atom("e"), Or(Atom("f"), Atom("g")))
        let formula3 = Implies(Atom("k"), Or(Atom("b"), Atom("y")))
        
        let completeFormula = Implies(formula, Implies(formula2, formula3))
        print(completeFormula.description)
        
        // When
        let result = getAtoms(from: completeFormula)
        
        // Then
        print(result.map { $0.name })
        return true
    }
    
}
