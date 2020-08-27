//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class Role{
    
    private var description: String
    private var f: String
    private var n: String

    /**
    A constructor of Role class which takes description, f, and n as inputs and initializes corresponding with
    these inputs.

    - Parameters:
        - description : Description of the role
        - f : Argument Type of the role
        - n : Number of the role
    */
    public init(description: String, f: String, n: String){
        self.description = description
        self.f = f
        self.n = n
    }

    /**
    Accessor for description.

    - Returns: description.
    */
    public func getDescription() -> String{
        return self.description
    }

    /**
    Accessor for f.

    - Returns: f.
    */
    public func getF() -> String{
        return self.f
    }

    /**
    Accessor for n.

    - Returns: n.
    */
    public func getN() -> String{
        return self.n
    }

    /**
    Constructs and returns the argument type for this role.

    - Returns: Argument type for this role.
    */
    public func getArgumentType() -> ArgumentType{
        return ArgumentTypeStatic.getArguments(argumentsType: "ARG" + self.f.uppercased())
    }

}
