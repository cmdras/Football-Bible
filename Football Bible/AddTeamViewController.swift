//
//  AddTeamViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


/*
 AlamoFire framework: https://github.com/Alamofire/Alamofire
 SwiftlyJSON framework: https://github.com/SwiftyJSON/SwiftyJSON
 */



class AddTeamViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var leagueTableView: UITableView!
    
    // HTTP Header code adapted from: https://grokswift.com/custom-headers-alamofire4-swift3/
    public typealias HTTPHeaders = [String: String]
    let headers: HTTPHeaders = [
        "X-Auth-Token": "46713f7c92534e12900421e14dabd324",
        "X-Response-Control": "minified"
    ]
    
    var teamDicts = [String: Int]()
    var leagues = [String]()
    var leagueDicts = [String: Int]()
    var leagueId = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        Alamofire.request("https://api.football-data.org/v1/competitions/?season=2016", headers: headers)
            .responseJSON { (responseData) -> Void in
                
                if((responseData.result.value) != nil) {
                    let json = JSON(responseData.result.value!)
                    self.leagueDicts = getLeagues(json: json)
                    
        
                    for league in self.leagueDicts.keys {
                        self.leagues.append(league)
                    }
        
                    self.leagueTableView.reloadData()
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = leagueTableView.dequeueReusableCell(withIdentifier: "leagueCell", for: indexPath)
            as! leagueNameCell
        
        cell.leagueName.text = leagues[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.leagueId = self.leagueDicts[self.leagues[indexPath.row]]!
        performSegue(withIdentifier: "leagueToTeam", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let aTVC2Segue = segue.destination as? addTeamViewController2 {
            aTVC2Segue.leagueId = self.leagueId
            aTVC2Segue.teamDicts = self.teamDicts
        }
    }

    
}
