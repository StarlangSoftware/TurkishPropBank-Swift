//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class FramesetArgument{
    
    var __argumentType: String
    var __definition: String
    var __function: String
    var __grammaticalCase: String

    /**
    A constructor of FramesetArgument class which takes argumentType and definition as input and initializes
    corresponding attributes

    - Parameters:
        - argumentType : ArgumentType of the frameset argument
        - definition : Definition of the frameset argument
        - function : Function of the frameset argument
        - grammaticalCase: Grammatical case of the frameset argument
    */
    public init(argumentType: String, definition: String, function: String, grmmaticalCase: String){
        self.__argumentType = argumentType
        self.__definition = definition
        self.__function = function
        self.__grammaticalCase = grmmaticalCase
    }

    /**
    Accessor for argumentType.

    - Returns: argumentType.
    */
    public func getArgumentType() -> String{
        return self.__argumentType
    }

    /**
    Accessor for definition.

    - Returns: definition.
    */
    public func getDefinition() -> String{
        return self.__definition
    }

    /**
    Accessor for function.

    - Returns: function.
    */
    public func getFunction() -> String{
        return self.__function
    }
    
    /**
    Accessor for grammaticalCase.

    - Returns: grammatical case.
    */
    public func getGrammaticalCase() -> String{
        return self.__grammaticalCase
    }

    /**
    Mutator for definition.

    - Parameter definition : definition to set.
    */
    public func setDefinition(definition: String){
        self.__definition = definition
    }

    /**
    Mutator for definition.

    - Parameter function : function to set.
    */
    public func setFunction(function: String){
        self.__function = function
    }
    
    /**
    Mutator for grammatical case.

    - Parameter grammatical case : grammatical case to set.
    */
    public func setGrammaticalCase(grammaticalCase: String){
        self.__grammaticalCase = grammaticalCase
    }

    /**
    __str__ converts an FramesetArgument to a string. It returns argument string which is in the form of
    argumentType:definition

    - Returns: string form of frameset argument
    */
    public func description() -> String{
        return self.__argumentType + ":" + self.__definition
    }

}
