//
//  HelperFunctions.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import Foundation
import SwiftyJSON


/// Parses the JSON to return a dictionary with League names and League ID's
func getLeagues(json: JSON) -> [String: Int] {
    var leagues = [String: Int]()
    for index in 0..<json.count {
        leagues[json[index]["caption"].rawString()!] = Int(json[index]["id"].rawString()!)!
    }
    return leagues
    
}

func getTeams(json:JSON) -> [String: Int] {
    var teams = [String: Int]()
    for index in 0..<json["teams"].count {
        teams[json["teams"][index]["name"].rawString()!] = Int(json["teams"][index]["id"].rawString()!)!
    }
    return teams
}
