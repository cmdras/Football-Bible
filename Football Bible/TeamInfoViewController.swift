//
//  TeamInfoViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TeamInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK:  Variables and Constants
    var teamDict = [String: Int]()
    var players = [String]()
    var numbers = [Int]()
    // HTTP Header code adapted from: https://grokswift.com/custom-headers-alamofire4-swift3/
    public typealias HTTPHeaders = [String: String]
    let headers: HTTPHeaders = [
        "X-Auth-Token": "46713f7c92534e12900421e14dabd324",
        "X-Response-Control": "minified"
    ]
    
    // MARK: Outlets
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var matchup: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var playerTableView: UITableView!
    @IBOutlet weak var noPlayerDataLabel: UILabel!
    
    // MARK: View Controller lifecycle function
    override func viewDidLoad() {
        super.viewDidLoad()
        self.teamName.text = teamDict.keys.first
        Alamofire.request("https://api.football-data.org/v1/teams/\(teamDict.values.first!)/players", headers: headers)
            .responseJSON { (responseData) -> Void in
                
                if((responseData.result.value) != nil) {
                    let json = JSON(responseData.result.value!)
                    let playerDict = getPlayers(json: json)
                    for name in playerDict.keys {
                        self.players.append(name)
                        self.numbers.append(playerDict[name]!)
                    }
                    
                    if self.players.count == 0 {
                        self.playerTableView.isHidden = true
                        self.noPlayerDataLabel.isHidden = false
                    } else {
                        self.playerTableView.isHidden = false
                        self.noPlayerDataLabel.isHidden = true
                    }
                    
                    self.playerTableView.reloadData()
                    
                }
        }
        
        Alamofire.request("https://api.football-data.org/v1/teams/\(teamDict.values.first!)/fixtures?timeFrame=n30", headers: headers)
            .responseJSON { (responseData) -> Void in
                
                if((responseData.result.value) != nil) {
                    let json = JSON(responseData.result.value!)
                    let match = getMatch(json: json)
                    if match.homeTeam != "" && match.awayTeam != "" {
                        self.matchup.isHidden = false
                        self.matchup.text = "\(match.homeTeam) vs \(match.awayTeam)"
                        self.matchDate.text = "\(match.dateTime)"
                    } else {
                        self.matchup.isHidden = true
                        self.matchDate.text = "No match data found"
                    }
                    
                    
                }
        }
        
    }

    // MARK: Table functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
            as! playerCell
        
        cell.playerName.text = players[indexPath.row]
        cell.playerNumber.text = String(numbers[indexPath.row])
        return cell
    }
    
}
