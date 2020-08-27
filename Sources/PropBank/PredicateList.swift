//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class PredicateList: NSObject, XMLParserDelegate{
    
    private var __list: [String:Predicate] = [:]
    private var newPredicate : Predicate? = nil
    private var newRoleSet : RoleSet? = nil
    private var newRole: Role? = nil
    private var lemma : String = ""

    override init(){
        super.init()
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        let url = thisDirectory.appendingPathComponent("files-english.txt")
        do{
            let fileContent = try String(contentsOf: url, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                let thisSourceFile = URL(fileURLWithPath: #file)
                let thisDirectory = thisSourceFile.deletingLastPathComponent()
                let url = thisDirectory.appendingPathComponent("Frames-English/" + line)
                let parser = XMLParser(contentsOf: url)!
                parser.delegate = self
                parser.parse()
            }
        } catch {
        }
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
        if (elementName == "predicate") {
            lemma = attributeDict["lemma"]!
            newPredicate = Predicate(lemma: lemma)
        } else if (elementName == "roleset") {
            let id = attributeDict["id"]
            let name = attributeDict["name"]
            newRoleSet = RoleSet(_id: id!, name: name!)
        } else if (elementName == "role") {
            var descr : String = ""
            if attributeDict["descr"] != nil{
                descr = attributeDict["descr"]!
            }
            var f : String = ""
            if attributeDict["f"] != nil{
                f = attributeDict["f"]!
            }
            var n : String = ""
            if attributeDict["n"] != nil{
                n = attributeDict["n"]!
            }
            newRole = Role(description: descr, f: f, n: n)
        }
    }
    
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        if (elementName == "predicate"){
            self.__list[lemma] = newPredicate
        } else if (elementName == "roleset"){
            newPredicate?.addRoleSet(roleSet: newRoleSet!)
        } else if (elementName == "role"){
            newRoleSet?.addRole(role: newRole!)
        }
    }

    /**
    The size method returns the number of predicates inside the list.

    - Returns: the size of the list dict.
    */
    public func size() -> Int{
        return self.__list.count
    }

    /**
    getPredicate method returns the Predicate with the given lemma.

    - Parameter lemma : Lemma of the searched predicate

    - Returns: Predicate which has the given lemma.
    */
    public func getPredicate(lemma: String) -> Predicate{
        return self.__list[lemma]!
    }

    /**
    The method returns all lemma in the predicate list.

    - Returns: All lemma in the predicate list.
    */
    public func getLemmaList() -> [String]{
        return self.__list.keys.sorted()
    }

}
