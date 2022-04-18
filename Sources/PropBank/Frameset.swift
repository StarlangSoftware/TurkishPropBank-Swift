//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class Frameset : Hashable{
    
    private var __framesetArguments: [FramesetArgument] = []
    private var __id: String = ""

    public init(id: String){
        self.__id = id
    }
    
    public static func == (lhs: Frameset, rhs: Frameset) -> Bool {
        return lhs.__id == rhs.__id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(__id)
    }

    /**
    containsArgument method which checks if there is an Argument of the given argumentType.

    - Parameter argumentType : ArgumentType of the searched Argument

    - Returns: true if the Argument with the given argumentType exists, false otherwise.
    */
    public func containsArgument(argumentType: ArgumentType) -> Bool{
        for framesetArgument in self.__framesetArguments{
            if ArgumentTypeStatic.getArguments(argumentsType: framesetArgument.getArgumentType()) == argumentType{
                return true
            }
        }
        return false
    }

    /**
    The addArgument method takes a type and a definition of a FramesetArgument as input, then it creates a new
    FramesetArgument from these inputs and adds it to the framesetArguments list.

    - Parameters:
        - argumentType : Type of the new FramesetArgument
        - definition : Definition of the new FramesetArgument
        - function: Function of the new FramesetArgument
    */
    public func addArgument(argumentType: String, definition: String, function: String){
        var check : Bool = false
        for framesetArgument in self.__framesetArguments{
            if framesetArgument.getArgumentType() == argumentType{
                framesetArgument.setDefinition(definition: definition)
                check = true
                break
            }
        }
        if !check{
            let arg : FramesetArgument = FramesetArgument(argumentType: argumentType, definition: definition, function: function)
            self.__framesetArguments.append(arg)
        }
    }

    /**
    The deleteArgument method takes a type and a definition of a FramesetArgument as input, then it searches for the
    FramesetArgument with these type and definition, and if it finds removes it from the framesetArguments list.

    - Parameters:
        - argumentType : Type of the to be deleted FramesetArgument
        - definition : Definition of the to be deleted FramesetArgument
    */
    public func deleteArgument(argumentType: String, definition: String){
        for i in 0..<self.__framesetArguments.count{
            let framesetArgument : FramesetArgument = self.__framesetArguments[i]
            if framesetArgument.getArgumentType() == argumentType && framesetArgument.getDefinition() == definition{
                self.__framesetArguments.remove(at: i)
                break
            }
        }
    }

    /**
    Accessor for framesetArguments.

    - Returns: framesetArguments.
    */
    public func getFramesetArguments() -> [FramesetArgument]{
        return self.__framesetArguments
    }

    /**
    Accessor for id.

    - Returns: id.
    */
    public func getId() -> String{
        return self.__id
    }

    /**
    Mutator for id.

    - Parameter _id : id to set.
    */
    public func setId(_id: String){
        self.__id = _id
    }

}
