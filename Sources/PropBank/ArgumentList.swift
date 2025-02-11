//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 11.02.2025.
//

import Foundation

public class ArgumentList{
    private var arguments: [Argument] = []
    
    /// Constructor of argument list from a string. The arguments for a word is a concatenated list of arguments
    /// separated via '#' character.
    /// - Parameter argumentList: String consisting of arguments separated with '#' character.
    public init(argumentList: String) {
        let items = argumentList.components(separatedBy: "#");
        for item in items{
            arguments.append(Argument(argument: item))
        }
    }
    
    /// Overloaded toString method to convert an argument list to a string. Concatenates the string forms of all
    /// arguments with '#' character.
    /// - Returns: String form of the argument list.
    public func description()->String{
        if arguments.isEmpty{
            return "NONE"
        } else {
            var result = arguments[0].description()
            for i in 1...arguments.count{
                result = result + "#" + arguments[i].description()
            }
            return result
        }
    }
    
    /// Replaces id's of predicates, which have previousId as synset id, with currentId.
    /// - Parameters:
    ///   - previousId: Previous id of the synset.
    ///   - currentId: Replacement id.
    public func updateConnectedId(previousId: String, currentId: String){
        for argument in arguments {
            if argument.getId() == previousId{
                argument.setId(id: currentId)
            }
        }
    }
    
    /// Adds a predicate argument to the argument list of this word.
    /// - Parameter predicateId: Synset id of this predicate.
    public func addPredicate(predicateId: String){
        if !arguments.isEmpty && arguments[0].getArgumentType() == "NONE"{
            arguments.removeFirst()
        }
        arguments.append(Argument(argumentType: "PREDICATE", _id: predicateId))
    }
    
    /// Removes the predicate with the given predicate id.
    public func removePredicate(){
        var i = 0
        for argument in arguments {
            if argument.getArgumentType() == "PREDICATE"{
                arguments.remove(at: i)
                break
            }
            i = i + 1
        }
    }
    
    /// Checks if one of the arguments is a predicate.
    /// - Returns: True, if one of the arguments is predicate; false otherwise.
    public func containsPredicate()->Bool{
        for argument in arguments {
            if argument.getArgumentType() == "PREDICATE"{
                return true
            }
        }
        return false
    }
    
    /// Checks if one of the arguments is a predicate with the given id.
    /// - Parameter predicateId: Synset id to check.
    /// - Returns: True, if one of the arguments is predicate; false otherwise.
    public func containsPredicateWithId(predicateId: String)->Bool{
        for argument in arguments {
            if argument.getArgumentType() == "PREDICATE" && argument.getId() == predicateId{
                return true
            }
        }
        return false
    }
    
    /// Returns the arguments as an array list of strings.
    /// - Returns: Arguments as an array list of strings.
    public func getFrameElements()->[String]{
        var result : [String] = []
        for argument in arguments {
            result.append(argument.description())
        }
        return result
    }
    
    /// Checks if the given argument with the given type and id exists or not.
    /// - Parameters:
    ///   - argumentType: Type of the argument to search for.
    ///   - id: Id of the argument to search for.
    /// - Returns: True if the argument exists, false otherwise.
    public func containsArgument(argumentType: String, id: String)->Bool{
        for argument in arguments {
            if argument.getArgumentType() == argumentType && argument.getId() == id{
                return true
            }
        }
        return false
    }

}
