//
//  Functions.swift
//  LogicaParaComputacao
//
//  Created by Academy on 22/11/20.
//

import Foundation

/*
 
 The goal in this module is to define functions that take a formula as input and
 do some computation on its syntactic structure.
 
 */

/// NumberOfAtoms
/// - Parameter formula: Returns the set of all atoms occurring in a formula. For example, observe the piece of code below. my_formula = Implies(Atom('p'), Or(Atom('p'), Atom('s'))) for atom in atoms(my_formula): print(atom) This piece of code above prints: p, s (Note that there is no repetition of p)
func numberOfAtoms(from formula: Formula) -> Int {
    var all = 1
    // I'll Change switch case afterwards.
    switch formula {
    case is Not:
        let formula = formula as! Not
        all = numberOfAtoms(from: formula.inner)
        return all
    case is Implies:
        let implies = formula as! Implies
        let left = implies.left
        let right = implies.right
        all = numberOfAtoms(from: right) + numberOfAtoms(from: left)
        return all
    case is Or:
        let or = formula as! Or
        let left = or.left
        let right = or.right
        all = numberOfAtoms(from: right) + numberOfAtoms(from: left)
        return all
    default:
        break
    }
    
    return all

}


func numberOfConnectives(from formula: Formula) -> Int {
    var all = 1
    switch formula {
    case is Atom:
        return 0
    case is Not:
        let formula = formula as! Not
        all = numberOfConnectives(from: formula.inner)
        return all
    case is Implies:
        let implies = formula as! Implies
        let left = implies.left
        let right = implies.right
        all = all + numberOfConnectives(from: right) + numberOfConnectives(from: left)
        return all
    case is Or:
        let or = formula as! Or
        let left = or.left
        let right = or.right
        all = all + numberOfConnectives(from: right) + numberOfConnectives(from: left)
        return all
    default:
        break
    }
    
    return all
}

func getAtoms(from formula: Formula) -> [Atom] {
    
    var atomList = [Atom]()
    // let isAtom = formula is Atom
    
    let totalAtoms = numberOfAtoms(from: formula)
    var count: Int = 0
    
    for index in 0...totalAtoms {
        if let atom = getAtom(from: formula, index: index, count: &count) {
            atomList.append(atom)
        }
    }
    
    print(count)
    
    
    return atomList
}

private func getAtom(from formula: Formula, index: Int, count: inout Int) -> Atom? {
    if index == count {
        if let atom = formula as? Atom {
            return atom
        } else {
            count+=1
            if let not = formula as? Not {
                if let atom = getAtom(from: not.inner, index: index, count: &count) { return atom }
            }
            
            if let implies = formula as? Implies {
                let left = implies.left
                let right = implies.right
                if let atom = getAtom(from: left, index: index, count: &count) { return atom }
                if let atom = getAtom(from: right, index: index, count: &count) { return atom }
            }
            
            if let or = formula as? Or {
                let left = or.left
                let right = or.right
                if let atom = getAtom(from: left, index: index, count: &count) { return atom }
                if let atom = getAtom(from: right, index: index, count: &count) { return atom }
            }
        }
    }
    return nil
}

