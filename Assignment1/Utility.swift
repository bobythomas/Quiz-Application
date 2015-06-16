//
//  Utility.swift
//  Assignment1
//
//  Created by boby thomas on 2015-06-15.
//  Copyright (c) 2015 boby thomas. All rights reserved.
//

import Foundation

class AnswerStracker {
    

    var answeredArray : [Bool] = [false,false,false,false,false]
    func markAsAnswered(index : Int, value : Bool)
    {
        answeredArray[index] = value
    }

    func checkIfQuizComplete()
    {
        var bDone : Bool = true
        for value in answeredArray
        {
            if value == false
            {
                bDone = false
                break
            }
        }
        if bDone == true
        {
            
        }
    }
}