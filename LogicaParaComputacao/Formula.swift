/*
 
This module is designed to define formulas in propositional logic.
 
For example, the following piece of code creates an object representing (p v s).
 
formula1 = Or(Atom("p"), Atom("s"))
 
As another example, the piece of code below creates an object that represents (p → (p v s)).
 
formula2 = Implies(Atom("p"), Or(Atom("p"), Atom("s")))
 
*/

// Sequence
public protocol Formula {
    var description: String { get }
}

public class Atom: Formula {

    let name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public var description: String {
        return self.name
    }
}

public class Implies: Formula {
    
    public let left: Formula
    public let right: Formula
    
    public init(_ left: Formula, _ right: Formula) {
        self.left = left
        self.right = right
    }
    
    public var description: String {
        return "(\(self.left.description) ⟶ \(self.right.description))"
    }
    
    public func isEqual() -> String {
        return ""
    }
}

public class Not: Formula {
    
    public let inner: Formula
    
    public init(_ inner: Formula) {
        self.inner = inner
    }
    
    
    public var description: String {
        return "∼\(inner.description)"
    }
}

public class And: Formula {
    public let left: Formula
    public let right: Formula

    public init(_ left: Formula, _ right: Formula) {
        self.left = left
        self.right = right
    }
    
    
    public var description: String {
        return "(\(self.left.description) ⟶ \(self.right.description))"
    }
}

public class Or: Formula {
    public let left: Formula
    public let right: Formula

    public init(_ left: Formula, _ right: Formula) {
        self.left = left
        self.right = right
    }
    
    public var description: String {
        return "(\(self.left.description) ⟶ \(self.right.description))"
    }
}



