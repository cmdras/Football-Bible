//
//  TeamInfoViewController.swift
//  Football Bible
//
//  Created by Christopher Ras on 09/12/2016.
//  Copyright © 2016 Chris Ras. All rights reserved.
//

import UIKit

class TeamInfoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var squadValue: UILabel!
    @IBOutlet weak var matchup: UILabel!
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var playerTableView: UITableView!
    
    var teamDicts = [String: Int]()
    
    let players = ["El Ghazi", "Ziyech", "Nouri", "Onana", "Cerny", "Boer", "Klaassen"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerTableView.dequeueReusableCell(withIdentifier: "playerCell", for: indexPath)
            as! playerCell
        
        cell.playerName.text = players[indexPath.row]
        return cell
    }
}
