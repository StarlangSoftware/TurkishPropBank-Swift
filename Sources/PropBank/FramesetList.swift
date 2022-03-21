//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class FramesetList: NSObject, XMLParserDelegate{
    
    private var __frames: [Frameset] = []
    private var frameSet: Frameset = Frameset(id: "")
    private var value: String = ""
    private var name: String = ""
    private var function: String = ""

    public override init(){
        super.init()
        let url = Bundle.module.url(forResource: "turkish-propbank", withExtension: "xml")!
        let parser = XMLParser(contentsOf: url)!
        parser.delegate = self
        parser.parse()
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if (elementName == "FRAMESET") {
            frameSet = Frameset(id: attributeDict["id"]!)
            __frames.append(frameSet)
        } else if (elementName == "ARG") {
            name = attributeDict["name"]!
            function = attributeDict["function"]!
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName == "FRAMESET"){
            value = ""
        } else if (elementName == "ARG"){
            frameSet.addArgument(argumentType: name, definition: value, function: function);
            value = ""
        }
    }

    public func parser(_ parser: XMLParser, foundCharacters string: String){
        value = value + string
    }

    /**
    frameExists method checks if there is a Frameset with the given synSet id.

    - Parameter synSetId : Id of the searched Frameset

    - Returns: true if the Frameset with the given id exists, false otherwise.
    */
    public func frameExists(synSetId: String) -> Bool{
        for f in self.__frames{
            if f.getId() == synSetId{
                return true
            }
        }
        return false
    }

    /**
    getFrameSet method returns the Frameset with the given synSet id or index

    - Parameter synSetId: Id of the searched Frameset

    - Returns: Frameset which has the given id.
    */
    public func getFrameSet(synSetId: String) -> Frameset?{
        for f in self.__frames{
            if f.getId() == synSetId{
                return f
            }
        }
        return nil
    }

    /**
    getFrameSet method returns the Frameset with the given synSet id or index

    - Parameter index: index of the Frameset

    - Returns: Frameset which has the given index.
    */
    public func getFrameSet(index: Int) -> Frameset{
        return self.__frames[index]
    }

    /**
    The addFrameset method takes a Frameset as input and adds it to the frames list.

    - Parameter frameset : Frameset to be added
    */
    public func addFrameset(frameset: Frameset){
        self.__frames.append(frameset)
    }

    /**
    The size method returns the size of the frames list.

    - Returns: the size of the frames list.
    */
    public func size() -> Int{
        return self.__frames.count
    }

    
}
