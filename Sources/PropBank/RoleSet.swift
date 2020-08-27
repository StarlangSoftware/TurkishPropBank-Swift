//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class RoleSet{
    
    private var __id: String
    private var __name: String
    private var __roles: [Role]

    /**
    A constructor of RoleSet class which takes id and name as inputs and initializes corresponding attributes
    with these inputs.

    - Parameters:
        - _id : Id of the roleSet
        - name : Name of the roleSet
    */
    init(_id: String, name: String){
        self.__id = _id
        self.__name = name
        self.__roles = []
    }

    /**
    Accessor for id.

    - Returns: id.
    */
    public func getId() -> String{
        return self.__id
    }

    /**
    Accessor for name.

    - Returns: name.
    */
    public func getName() -> String{
        return self.__name
    }

    /**
    The size method returns the size of the roles list.

    - Returns: the size of the roles list.
    */
    public func size() -> Int{
        return self.__roles.count
    }

    /**
    The addRole method takes a Role as input and adds it to the roles list.

    - Parameter role : Role to be added
    */
    public func addRole(role: Role){
        self.__roles.append(role)
    }

    /**
    The getRole method returns the role at the given index.

    - Parameter index : Index of the role

    - Returns: Role at the given index.
    */
    public func getRole(index: Int) -> Role{
        return self.__roles[index]
    }

    /**
    Finds and returns the role with the given argument number n. For example, if n == 0, the method returns
    the argument ARG0.

    - Parameter n : Argument number

    - Returns: The role with the given argument number n.
    */
    public func getRoleWithArgument(n: String) -> Role?{
        for role in self.__roles{
            if role.getN() == n{
                return role
            }
        }
        return nil
    }

}
