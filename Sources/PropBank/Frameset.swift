//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

class Frameset: NSObject, XMLParserDelegate{
    
    var __framesetArguments: [FramesetArgument] = []
    var __id: String = ""
    var value: String = ""
    var name: String = ""
    var function: String = ""

    init(url: URL){
        super.init()
        let parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if (elementName == "FRAMESET") {
            self.__id = attributeDict["id"]!
        } else if (elementName == "ARG") {
            name = attributeDict["name"]!
            function = attributeDict["function"]!
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName == "FRAMESET"){
            value = ""
        } else if (elementName == "ARG"){
            self.__framesetArguments.append(FramesetArgument(argumentType: name, definition: value, function: function))
            value = ""
        }
    }

    func parser(_ parser: XMLParser, foundCharacters string: String){
        value = value + string
    }

    /**
    containsArgument method which checks if there is an Argument of the given argumentType.

    - Parameter argumentType : ArgumentType of the searched Argument

    - Returns: true if the Argument with the given argumentType exists, false otherwise.
    */
    func containsArgument(argumentType: ArgumentType) -> Bool{
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
    func addArgument(argumentType: String, definition: String, function: String){
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
    func deleteArgument(argumentType: String, definition: String){
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
    func getFramesetArguments() -> [FramesetArgument]{
        return self.__framesetArguments
    }

    /**
    Accessor for id.

    - Returns: id.
    */
    func getId() -> String{
        return self.__id
    }

    /**
    Mutator for id.

    - Parameter _id : id to set.
    */
    func setId(_id: String){
        self.__id = _id
    }

}
