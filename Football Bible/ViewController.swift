//
//  ViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 07/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var teamTable: UITableView!
    
    var footballTeams = [String]()
    var teamDicts = [String: Int]()
    var chosenTeam = [String: Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        for team in teamDicts.keys {
            footballTeams.append(team)
            teamTable.reloadData()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return footballTeams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = teamTable.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
            as! teamCell
        
        cell.teamName.text = footballTeams[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenTeam[footballTeams[indexPath.row]] = self.teamDicts[footballTeams[indexPath.row]]
        performSegue(withIdentifier: "teamInfo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let segueVC = segue.destination as? AddTeamViewController {
            segueVC.teamDicts = self.teamDicts
        }
        
        else if let segueVC = segue.destination as? TeamInfoViewController {
            segueVC.teamDict = self.chosenTeam
        }
    }


}

