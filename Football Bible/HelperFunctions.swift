//
//  HelperFunctions.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/*
    AlamoFire framework: https://github.com/Alamofire/Alamofire
    SwiftlyJSON framework: https://github.com/SwiftyJSON/SwiftyJSON
*/


// HTTP Header code adapted from: https://grokswift.com/custom-headers-alamofire4-swift3/
public typealias HTTPHeaders = [String: String]
let headers: HTTPHeaders = [
    "X-Auth-Token": "46713f7c92534e12900421e14dabd324",
    "X-Response-Control": "minified"
]


/// Searches the football-data.org API for all available competitions.
func getLeagues(json: JSON) -> [String: Int] {
    var leagues = [String: Int]()
    for index in 0..<json.count {
        leagues[json[index]["caption"].rawString()!] = Int(json[index]["id"].rawString()!)!
    }
    return leagues
    
}
