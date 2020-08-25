//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

class ArgumentTypeStatic{
    
    /**
    The getArguments method takes an argumentsType string and returns the ArgumentType form of it.

    - Parameter argumentsType : Type of the argument in string form

    - Returns: Type of the argument in ArgumentType form
    */
    static func getArguments(argumentsType: String) -> ArgumentType{
        for argumentType in ArgumentType.allCases{
            if argumentsType == argumentType.rawValue{
                return argumentType
            }
        }
        return ArgumentType.NONE
    }

    /**
    The getPropbankType method takes an argumentType in ArgumentType form and returns the string form of it.

    - Parameter argumentType : Type of the argument in {@link ArgumentType} form

    - Returns: Type of the argument in string form
    */
    static func getPropbankType(argumentType: ArgumentType) -> String{
        if argumentType == ArgumentType.NONE{
            return "NONE"
        }
        return argumentType.rawValue
    }

}
