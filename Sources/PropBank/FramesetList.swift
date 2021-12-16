//
//  File.swift
//  
//
//  Created by Olcay Taner YILDIZ on 25.08.2020.
//

import Foundation

public class FramesetList{
    
    private var __frames: [Frameset] = []

    public init(){
        let url = Bundle.module.url(forResource: "files-turkish", withExtension: "txt")
        do{
            let fileContent = try String(contentsOf: url!, encoding: .utf8)
            let lines = fileContent.split(whereSeparator: \.isNewline)
            for line in lines{
                let thisSourceFile = URL(fileURLWithPath: #file)
                let thisDirectory = thisSourceFile.deletingLastPathComponent()
                let url = thisDirectory.appendingPathComponent("Frames-Turkish/" + line)
                self.__frames.append(Frameset(url: url))
            }
        } catch {
        }
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
