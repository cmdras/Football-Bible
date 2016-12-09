//
//  addTeamViewController2.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class addTeamViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var teamsTable: UITableView!
    let leagueTeams = ["Ajax", "PSV", "Feyenoord"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
}
