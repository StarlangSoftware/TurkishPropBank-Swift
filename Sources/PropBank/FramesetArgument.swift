//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

class FramesetArgument{
    
    var __argumentType: String
    var __definition: String
    var __function: String

    /**
    A constructor of FramesetArgument class which takes argumentType and definition as input and initializes
    corresponding attributes

    - Parameters:
        - argumentType : ArgumentType of the frameset argument
        - definition : Definition of the frameset argument
        - function : Function of the frameset argument
    */
    init(argumentType: String, definition: String, function: String){
        self.__argumentType = argumentType
        self.__definition = definition
        self.__function = function
    }

    /**
    Accessor for argumentType.

    - Returns: argumentType.
    */
    func getArgumentType() -> String{
        return self.__argumentType
    }

    /**
    Accessor for definition.

    - Returns: definition.
    */
    func getDefinition() -> String{
        return self.__definition
    }

    /**
    Accessor for function.

    - Returns: function.
    */
    func getFunction() -> String{
        return self.__function
    }

    /**
    Mutator for definition.

    - Parameter definition : definition to set.
    */
    func setDefinition(definition: String){
        self.__definition = definition
    }

    /**
    Mutator for definition.

    - Parameter function : function to set.
    */
    func setFunction(function: String){
        self.__function = function
    }

    /**
    __str__ converts an FramesetArgument to a string. It returns argument string which is in the form of
    argumentType:definition

    - Returns: string form of frameset argument
    */
    func description() -> String{
        return self.__argumentType + ":" + self.__definition
    }

}
