//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

class Role{
    
    var description: String
    var f: String
    var n: String

    /**
    A constructor of Role class which takes description, f, and n as inputs and initializes corresponding with
    these inputs.

    - Parameters:
        - description : Description of the role
        - f : Argument Type of the role
        - n : Number of the role
    */
    init(description: String, f: String, n: String){
        self.description = description
        self.f = f
        self.n = n
    }

    /**
    Accessor for description.

    - Returns: description.
    */
    func getDescription() -> String{
        return self.description
    }

    /**
    Accessor for f.

    - Returns: f.
    */
    func getF() -> String{
        return self.f
    }

    /**
    Accessor for n.

    - Returns: n.
    */
    func getN() -> String{
        return self.n
    }

    /**
    Constructs and returns the argument type for this role.

    - Returns: Argument type for this role.
    */
    func getArgumentType() -> ArgumentType{
        return ArgumentTypeStatic.getArguments(argumentsType: "ARG" + self.f.uppercased())
    }

}
