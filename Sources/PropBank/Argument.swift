//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class Argument {
    private var argumentType: String
    private var id: String
    
    /**
    A constructor of Argument class which takes argument string which is in the form of argumentType$id
    and parses this string into argumentType and id. If the argument string does not contain '$' then the
    constructor return a NONE type argument.

    - Parameter argument : Argument string containing the argumentType and id
    */
    public init(argument: String){
        if argument.contains("$"){
            self.argumentType = String(argument[..<argument.range(of: "$")!.lowerBound])
            self.id = String(argument[argument.range(of: "$")!.upperBound...])
        } else {
            self.argumentType = "NONE"
            self.id = ""
        }
    }

    /**
    Another constructor of Argument class which takes argumentType and id as inputs and initializes corresponding
    attributes

    - Parameters:
        - argumentType : Type of the argument
        - _id : Id of the argument
    */
    public init(argumentType: String, _id: String){
        self.argumentType = argumentType
        self.id = _id
    }

    /**
    Accessor for argumentType.

    - Returns: argumentType.
    */
    public func getArgumentType() -> String{
        return self.argumentType
    }

    /**
    Accessor for id.

    - Returns: id.
    */
    public func getId() -> String{
        return self.id
    }

    public func setId(id: String){
        self.id = id
    }

    /**
    __str__ converts an Argument to a string. If the argumentType is "NONE" returns only "NONE", otherwise
    it returns argument string which is in the form of argumentType$id

    - Returns: string form of argument
    */
    public func description() -> String{
        if self.argumentType == "NONE"{
            return self.argumentType
        } else {
            return self.argumentType + "$" + self.id
        }
    }

}
