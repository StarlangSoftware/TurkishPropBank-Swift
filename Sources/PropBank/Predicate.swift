//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class Predicate{
    
    var __lemma: String
    var __roleSets: [RoleSet]

    /**
    A constructor of Predicate class which takes lemma as input and initializes lemma with this input.
    The constructor also initializes the roleSets array.

    - Parameter lemma : Lemma of the predicate
    */
    init(lemma: String){
        self.__lemma = lemma
        self.__roleSets = []
    }

    /**
    Accessor for lemma.

    - Returns: lemma.
    */
    func getLemma() -> String{
        return self.__lemma
    }

    /**
    The addRoleSet method takes a RoleSet as input and adds it to the roleSets list.

    - Parameter roleSet : RoleSet to be added
    */
    func addRoleSet(roleSet: RoleSet){
        self.__roleSets.append(roleSet)
    }

    /**
    The size method returns the size of the roleSets list.

    - Returns: the size of the roleSets list.
    */
    func size() -> Int{
        return self.__roleSets.count
    }

    /**
    The getRoleSet method returns the roleSet at the given index.

    - Parameter index : Index of the roleSet

    - Returns: RoleSet at the given index.
    */
    func getRoleSet(index: Int) -> RoleSet{
        return self.__roleSets[index]
    }

    /**
    Another getRoleSet method which returns the roleSet with the given roleSet id.

    - Parameter roleId : Id of the searched roleSet

    - Returns: RoleSet which has the given id.
    */
    func getRoleSetWithId(roleId: String) -> RoleSet?{
        for roleSet in self.__roleSets{
            if roleSet.getId() == roleId{
                return roleSet
            }
        }
        return nil
    }

}
