//
//  HelperFunctions.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import Foundation
import SwiftyJSON

/// A Football match Class
class FootballMatch {
    var homeTeam = String()
    var awayTeam = String()
    var dateTime = String()
}

/// Parses the JSON to return a dictionary with League names and League ID's
func getLeagues(json: JSON) -> [String: Int] {
    var leagues = [String: Int]()
    for index in 0..<json.count {
        leagues[json[index]["caption"].rawString()!] = Int(json[index]["id"].rawString()!)!
    }
    return leagues
    
}

/// Parses the JSON to return a dictionary with team names and team ID's
func getTeams(json:JSON) -> [String: Int] {
    var teams = [String: Int]()
    for index in 0..<json["teams"].count {
        teams[json["teams"][index]["name"].rawString()!] = Int(json["teams"][index]["id"].rawString()!)!
    }
    return teams
}

/// Parses the JSON to return a dictionary with player names and player ID's
func getPlayers(json:JSON) -> [String: Int] {
    var players = [String: Int]()
    if json["players"].count > 0 {
        for index in 0..<json["players"].count {
            players[json["players"][index]["name"].rawString()!] = Int(json["players"][index]["jerseyNumber"].rawString()!)!
        }
    }
    return players
}

/// Parses the JSON to return a FootballMatch Object with details
func getMatch(json:JSON) -> FootballMatch {
    let match = FootballMatch()
    if json["fixtures"].count > 0 {
        for index in 0..<1 {
            match.homeTeam = json["fixtures"][index]["homeTeamName"].rawString()!
            match.awayTeam = json["fixtures"][index]["awayTeamName"].rawString()!
            match.dateTime = dateTimeParsing(dateTime: json["fixtures"][index]["date"].rawString()!)
        }
    }
    return match

}

/// Parses the JSON to return a string containing the date and time of a match
func dateTimeParsing(dateTime:String) -> String {
    let dateTimeArray = dateTime.components(separatedBy: "T")
    let parsedString = "\(dateTimeArray[0]) @ \(dateTimeArray[1])"
    return parsedString
}
