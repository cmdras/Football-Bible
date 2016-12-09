//
//  addTeamViewController2.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class addTeamViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var teamsTable: UITableView!
    var leagueId = Int()
    var leagueTeams = [String]()
    var teamDicts = [String: Int]()
    var tempDict = [String: Int]()
    var selectedTeam = String()
    
    // HTTP Header code adapted from: https://grokswift.com/custom-headers-alamofire4-swift3/
    public typealias HTTPHeaders = [String: String]
    let headers: HTTPHeaders = [
        "X-Auth-Token": "46713f7c92534e12900421e14dabd324",
        "X-Response-Control": "minified"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.football-data.org/v1/competitions/\(self.leagueId)/teams", headers: headers)
            .responseJSON { (responseData) -> Void in
                
                if((responseData.result.value) != nil) {
                    let json = JSON(responseData.result.value!)
                    self.tempDict = getTeams(json: json)
                    
                    for team in self.tempDict.keys {
                        self.leagueTeams.append(team)
                    }
                    
                    self.teamsTable.reloadData()
                    
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamsTable.dequeueReusableCell(withIdentifier: "addTeamCell", for: indexPath)
            as! addTeamCell
        
        cell.teamName.text = leagueTeams[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedTeam = leagueTeams[indexPath.row]
        self.teamDicts[self.selectedTeam] = self.tempDict[selectedTeam]
        performSegue(withIdentifier: "addTeam", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VC = segue.destination as? ViewController {
            VC.teamDicts = self.teamDicts        }
    }
}
